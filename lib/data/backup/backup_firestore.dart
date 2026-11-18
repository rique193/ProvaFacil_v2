import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '../local/app_database.dart';
import 'backup_alunos.dart';
import 'backup_resultados.dart';
import 'dados_backup.dart';
import 'id_instalacao.dart';
import 'mapeamento_firestore.dart';

/// Backup automático de cada aluno cadastrado ou editado na coleção "alunos", e remoção do aluno e
/// dos resultados dele quando é excluído.
///
/// Não espera a nuvem: o Firestore grava primeiro no cache local e envia quando houver internet (a
/// fila sobrevive ao app ser fechado). Assim o cadastro nunca fica preso à rede; uma falha só vai
/// para o log.
class BackupAlunosFirestore implements BackupAlunos {
  BackupAlunosFirestore(this._idInstalacao, {FirebaseFirestore? firestore})
    : _firestoreInformado = firestore;

  static const _tag = 'BackupAlunosFirestore';

  final IdInstalacao _idInstalacao;
  final FirebaseFirestore? _firestoreInformado;

  FirebaseFirestore get _firestore => _firestoreInformado ?? FirebaseFirestore.instance;

  @override
  Future<void> salvarAluno(AlunoEntity aluno) async {
    final id = await _idInstalacao.obter();
    _semEsperar(
      _firestore
          .collection(colecaoAlunos)
          .doc(idDocumentoAluno(id, aluno.id))
          .set(alunoParaMapa(aluno, id, DateTime.now().millisecondsSinceEpoch)),
      'Falha no backup do aluno ${aluno.id}.',
      _tag,
    );
  }

  @override
  Future<void> removerAluno(int alunoId, List<int> provaIds) async {
    final id = await _idInstalacao.obter();
    // Um aluno tem no máximo um resultado por prova, então cabe num lote só na prática.
    final lote = _firestore.batch()
      ..delete(_firestore.collection(colecaoAlunos).doc(idDocumentoAluno(id, alunoId)));
    for (final provaId in provaIds) {
      lote.delete(
        _firestore.collection(colecaoResultados).doc(idDocumentoResultado(id, provaId, alunoId)),
      );
    }
    _semEsperar(lote.commit(), 'Falha ao remover o aluno $alunoId da nuvem.', _tag);
  }
}

/// Envio de alunos e resultados em lotes (`WriteBatch`) de até [tamanhoLote] documentos, o limite
/// do Firestore. Como no [BackupAlunosFirestore], não espera a nuvem: os lotes ficam na fila do
/// Firestore até haver internet, e uma falha só vai para o log.
class BackupResultadosFirestore implements BackupResultados {
  BackupResultadosFirestore(this._idInstalacao, {FirebaseFirestore? firestore})
    : _firestoreInformado = firestore;

  static const _tag = 'BackupResultadosFirestore';
  static const tamanhoLote = 500;

  final IdInstalacao _idInstalacao;
  final FirebaseFirestore? _firestoreInformado;

  FirebaseFirestore get _firestore => _firestoreInformado ?? FirebaseFirestore.instance;

  @override
  Future<void> enviar(List<AlunoEntity> alunos, List<ResultadoParaBackup> resultados) async {
    final id = await _idInstalacao.obter();
    final agora = DateTime.now().millisecondsSinceEpoch;
    final documentos = [
      for (final aluno in alunos)
        (
          _firestore.collection(colecaoAlunos).doc(idDocumentoAluno(id, aluno.id)),
          alunoParaMapa(aluno, id, agora),
        ),
      for (final dados in resultados)
        (
          _firestore
              .collection(colecaoResultados)
              .doc(idDocumentoResultado(id, dados.resultado.provaId, dados.resultado.alunoId)),
          resultadoParaMapa(dados, id, agora),
        ),
    ];

    for (final lote in documentos.slices(tamanhoLote)) {
      final batch = _firestore.batch();
      for (final (documento, campos) in lote) {
        batch.set(documento, campos);
      }
      _semEsperar(batch.commit(), 'Falha no backup de ${lote.length} documentos.', _tag);
    }
  }
}

/// Deixa o envio na fila do Firestore sem esperar a rede; uma falha só vai para o log.
void _semEsperar(Future<void> envio, String mensagem, String tag) {
  unawaited(
    envio.catchError((Object erro, StackTrace pilha) {
      log(mensagem, name: tag, error: erro, stackTrace: pilha);
    }),
  );
}
