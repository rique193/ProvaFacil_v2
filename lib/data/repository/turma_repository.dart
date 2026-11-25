import '../../domain/aluno/formato_turma.dart';
import '../../util/comparacao.dart';
import '../local/app_database.dart';

class TurmaRepository {
  TurmaRepository(this._db);

  final AppDatabase _db;

  Stream<List<TurmaEntity>> observarTodas() {
    return _db.turmaDao.observarTodas().map((lista) {
      final ordenada = List<TurmaEntity>.from(lista)
        ..sort((a, b) => compararSemCaixa(a.nome, b.nome));
      return ordenada;
    });
  }

  Future<int> salvar(String nome) async {
    final normalizada = FormatoTurma.normalizar(nome);
    if (normalizada.isEmpty) {
      throw ArgumentError('Informe o nome da turma.');
    }

    final existentes = await _db.turmaDao.listarTodas();
    final jaExiste = existentes.any((t) => compararSemCaixa(t.nome, normalizada) == 0);
    if (jaExiste) {
      throw ArgumentError('Já existe uma turma com esse nome.');
    }

    return _db.turmaDao.inserir(TurmasCompanion.insert(nome: normalizada));
  }

  Future<void> excluir(int id) => _db.turmaDao.excluir(id);
}