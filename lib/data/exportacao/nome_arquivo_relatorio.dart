import 'package:unorm_dart/unorm_dart.dart' as unorm;

const _tamanhoMaximoTitulo = 60;

/// Nome sugerido para o arquivo exportado: `titulo_dd-MM-yyyy.xlsx`, sem acentos e só com
/// letras, números, "-" e "_". Ex.: "Cálculo I: Prova 2" em 28/10/2026 → "Calculo_I_Prova_2_28-10-2026.xlsx".
///
/// A data usa o fuso do aparelho; com [utc] usa UTC.
String nomeArquivoRelatorio(String tituloProva, int exportadoEm, {bool utc = false}) =>
    '${_tituloSeguro(tituloProva, 'relatorio')}_${_dataDoArquivo(exportadoEm, utc)}.xlsx';

/// Nome sugerido para o PDF da prova: `titulo_dd-MM-yyyy.pdf`, no mesmo estilo do relatório
/// (sem acentos e só com letras, números, "-" e "_").
String nomeArquivoPdfProva(String tituloProva, int geradoEm, {bool utc = false}) =>
    '${_tituloSeguro(tituloProva, 'prova')}_${_dataDoArquivo(geradoEm, utc)}.pdf';

String _tituloSeguro(String tituloProva, String padrao) {
  final semAcentos = unorm.nfd(tituloProva).replaceAll(RegExp(r'\p{M}+', unicode: true), '');
  var titulo = semAcentos
      .replaceAll(RegExp(r'[^A-Za-z0-9-]+'), '_')
      .replaceAll(RegExp(r'_{2,}'), '_')
      .replaceAll(RegExp(r'^[_-]+|[_-]+$'), '');
  if (titulo.length > _tamanhoMaximoTitulo) titulo = titulo.substring(0, _tamanhoMaximoTitulo);
  titulo = titulo.replaceAll(RegExp(r'[_-]+$'), '');
  return titulo.isEmpty ? padrao : titulo;
}

String _dataDoArquivo(int milissegundos, bool utc) {
  final data = DateTime.fromMillisecondsSinceEpoch(milissegundos, isUtc: utc);
  final dia = data.day.toString().padLeft(2, '0');
  final mes = data.month.toString().padLeft(2, '0');
  final ano = data.year.toString().padLeft(4, '0');
  return '$dia-$mes-$ano';
}
