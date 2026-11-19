import 'package:collection/collection.dart';

import '../local/app_database.dart';
import 'dados_backup.dart';

// Conversão dos dados do banco local em documentos do Firestore. Funções puras (sem Firebase), para
// os testes unitários.
//
// Os ids dos documentos começam pelo id da instalação (`IdInstalacao`): todos do grupo usam o mesmo
// projeto Firebase, e sem o prefixo o aluno 1 de um aparelho sobrescreveria o aluno 1 de outro.

const colecaoAlunos = 'alunos';
const colecaoResultados = 'resultados';

/// Id do documento do aluno: `{idInstalacao}_{alunoId}`.
String idDocumentoAluno(String idInstalacao, int alunoId) =>
    '${_validarIdInstalacao(idInstalacao)}_$alunoId';

/// Id do documento do resultado: `{idInstalacao}_{provaId}_{alunoId}`. Usa o par prova + aluno
/// (único no banco) e não o id do resultado, que muda quando a folha é corrigida de novo; assim a
/// nova correção sobrescreve o mesmo documento.
String idDocumentoResultado(String idInstalacao, int provaId, int alunoId) =>
    '${_validarIdInstalacao(idInstalacao)}_${provaId}_$alunoId';

/// Campos do documento do aluno. Matrícula e e-mail vazios vão como `null` para apagar um valor antigo.
Map<String, Object?> alunoParaMapa(AlunoEntity aluno, String idInstalacao, int atualizadoEm) => {
  'idInstalacao': idInstalacao,
  'alunoId': aluno.id,
  'nome': aluno.nome,
  'turma': aluno.turma,
  'matricula': aluno.matricula,
  'email': aluno.email,
  'atualizadoEm': atualizadoEm,
};

/// Campos do documento do resultado, com a prova, o aluno e as respostas por questão.
Map<String, Object?> resultadoParaMapa(
  ResultadoParaBackup dados,
  String idInstalacao,
  int atualizadoEm,
) {
  final resultado = dados.resultado;
  return {
    'idInstalacao': idInstalacao,
    'prova': {
      'id': resultado.provaId,
      'titulo': resultado.tituloProva,
      'disciplina': resultado.disciplina,
    },
    'aluno': {
      'id': resultado.alunoId,
      'nome': resultado.nomeAluno,
      'turma': resultado.turma,
      'matricula': resultado.matricula,
    },
    'totalQuestoes': resultado.totalQuestoes,
    'acertos': resultado.acertos,
    'erros': resultado.erros,
    'emBranco': resultado.emBranco,
    'nota': resultado.nota,
    'notaMaxima': resultado.notaMaxima,
    'corrigidoEm': resultado.corrigidoEm,
    'atualizadoEm': atualizadoEm,
    'respostas': [
      for (final resposta in dados.respostas)
        {
          'numero': resposta.numeroQuestao,
          'questaoId': resposta.questaoId,
          'letrasMarcadas': resposta.letrasMarcadas,
          'letraCorreta': resposta.letraCorreta,
          'situacao': resposta.situacao.nome,
        },
    ],
  };
}

/// Junta cada resultado às suas respostas, ordenadas pelo número da questão.
List<ResultadoParaBackup> agruparResultadosParaBackup(
  List<LinhaResultadoBackup> resultados,
  List<LinhaRespostaBackup> respostas,
) {
  final respostasPorResultado = groupBy(respostas, (resposta) => resposta.resultadoId);
  return [
    for (final resultado in resultados)
      ResultadoParaBackup(
        resultado: resultado,
        respostas: _emOrdem(respostasPorResultado[resultado.resultadoId] ?? const []),
      ),
  ];
}

List<LinhaRespostaBackup> _emOrdem(List<LinhaRespostaBackup> respostas) {
  final ordenadas = [...respostas];
  mergeSort(
    ordenadas,
    compare: (a, b) {
      final porNumero = a.numeroQuestao.compareTo(b.numeroQuestao);
      return porNumero != 0 ? porNumero : a.questaoId.compareTo(b.questaoId);
    },
  );
  return ordenadas;
}

/// O Firestore não aceita `/` em ids de documento; um id vazio geraria ids iguais entre aparelhos.
String _validarIdInstalacao(String idInstalacao) {
  if (idInstalacao.trim().isEmpty || idInstalacao.contains('/')) {
    throw ArgumentError('Id de instalação inválido: "$idInstalacao"');
  }
  return idInstalacao;
}
