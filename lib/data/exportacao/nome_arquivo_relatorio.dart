import 'package:unorm_dart/unorm_dart.dart' as unorm;

const _tamanhoMaximoTitulo = 60;

/// Nome sugerido para o arquivo exportado: `titulo_dd-MM-yyyy.xlsx`, sem acentos e só com
/// letras, números, "-" e "_". Ex.: "Cálculo I: Prova 2" em 28/10/2026 → "Calculo_I_Prova_2_28-10-2026.xlsx".
///
/// A data usa o fuso do aparelho; com [utc] usa UTC.
String nomeArquivoRelatorio(String tituloProva, int exportadoEm, {bool utc = false}) {
  final semAcentos = unorm.nfd(tituloProva).replaceAll(RegExp(r'\p{M}+', unicode: true), '');
  var titulo = semAcentos
      .replaceAll(RegExp(r'[^A-Za-z0-9-]+'), '_')
      .replaceAll(RegExp(r'_{2,}'), '_')
      .replaceAll(RegExp(r'^[_-]+|[_-]+$'), '');
  if (titulo.length > _tamanhoMaximoTitulo) titulo = titulo.substring(0, _tamanhoMaximoTitulo);
  titulo = titulo.replaceAll(RegExp(r'[_-]+$'), '');
  if (titulo.isEmpty) titulo = 'relatorio';

  final data = DateTime.fromMillisecondsSinceEpoch(exportadoEm, isUtc: utc);
  final dia = data.day.toString().padLeft(2, '0');
  final mes = data.month.toString().padLeft(2, '0');
  final ano = data.year.toString().padLeft(4, '0');
  return '${titulo}_$dia-$mes-$ano.xlsx';
}
