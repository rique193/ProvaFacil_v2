import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Id desta instalação do app: um UUID gerado na primeira vez e guardado no `shared_preferences`.
/// Serve de prefixo dos documentos no Firestore (ver `idDocumentoAluno`). Apagar os dados do app ou
/// reinstalá-lo gera um id novo, e o backup recomeça em documentos novos (os antigos ficam na nuvem).
///
/// O app cria uma instância só (`Provider<IdInstalacao>` no `main.dart`), e ela guarda a leitura:
/// chamadas ao mesmo tempo recebem o mesmo id.
class IdInstalacao {
  IdInstalacao({Future<SharedPreferences> Function()? preferencias, String Function()? gerarId})
    : _preferencias = preferencias ?? SharedPreferences.getInstance,
      _gerarId = gerarId ?? const Uuid().v4;

  static const chaveId = 'id_instalacao';

  final Future<SharedPreferences> Function() _preferencias;
  final String Function() _gerarId;
  Future<String>? _id;

  Future<String> obter() => _id ??= _lerOuGerar().onError<Object>((erro, pilha) {
    _id = null; // tenta ler de novo na próxima chamada
    Error.throwWithStackTrace(erro, pilha);
  });

  Future<String> _lerOuGerar() async {
    final preferencias = await _preferencias();
    final salvo = preferencias.getString(chaveId);
    if (salvo != null) return salvo;
    final novo = _gerarId();
    await preferencias.setString(chaveId, novo);
    return novo;
  }
}
