import '../../util/comparacao.dart';
import '../local/app_database.dart';

class DisciplinaRepository {
  DisciplinaRepository(this._db);

  final AppDatabase _db;

  Stream<List<DisciplinaEntity>> observarTodas() {
    return _db.disciplinaDao.observarTodas().map((lista) {
      final ordenada = List<DisciplinaEntity>.from(lista)
        ..sort((a, b) => compararSemCaixa(a.nome, b.nome));
      return ordenada;
    });
  }

  Future<int> salvar(String nome) async {
    final limpa = nome.trim();
    if (limpa.isEmpty) {
      throw ArgumentError('Informe o nome da disciplina.');
    }

    final existentes = await _db.disciplinaDao.listarTodas();
    final jaExiste = existentes.any((d) => compararSemCaixa(d.nome, limpa) == 0);
    if (jaExiste) {
      throw ArgumentError('Já existe uma disciplina com esse nome.');
    }

    return _db.disciplinaDao.inserir(DisciplinasCompanion.insert(nome: limpa));
  }

  Future<void> excluir(int id) => _db.disciplinaDao.excluir(id);
}