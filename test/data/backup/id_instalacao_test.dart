import 'package:flutter_test/flutter_test.dart';
import 'package:provafacil/data/backup/id_instalacao.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('gera um UUID na primeira vez e guarda com a chave id_instalacao', () async {
    final id = await IdInstalacao().obter();

    expect(
      id,
      matches(RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$')),
    );
    final preferencias = await SharedPreferences.getInstance();
    expect(preferencias.getString('id_instalacao'), id);
  });

  test('chamadas ao mesmo tempo geram o id uma vez só', () async {
    var gerados = 0;
    final idInstalacao = IdInstalacao(gerarId: () => 'id-${++gerados}');

    final ids = await Future.wait([for (var i = 0; i < 5; i++) idInstalacao.obter()]);

    expect(ids.toSet(), {'id-1'});
    expect(gerados, 1);
  });

  test('outra instância lê o id já guardado', () async {
    final primeiro = await IdInstalacao().obter();
    expect(await IdInstalacao(gerarId: () => 'outro').obter(), primeiro);
  });

  test('uma falha na leitura não fica guardada', () async {
    var tentativas = 0;
    final idInstalacao = IdInstalacao(
      preferencias: () {
        tentativas++;
        if (tentativas == 1) return Future.error(StateError('disco indisponível'));
        return SharedPreferences.getInstance();
      },
      gerarId: () => 'id-novo',
    );

    await expectLater(idInstalacao.obter(), throwsStateError);
    expect(await idInstalacao.obter(), 'id-novo');
  });
}
