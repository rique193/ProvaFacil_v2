import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import '../local/app_database.dart';

/// Exporta o relatório de notas de uma prova.
///
/// Por enquanto gera CSV (UTF-8 com BOM e separador `;`, que o Excel em português abre
/// direto). O XLSX completo, com as abas de estatísticas, entra depois que o PR com
/// `EstatisticasProva`, `EstatisticasRepository` e `formatarTurmas` for mesclado na main.
class ExportadorRelatorio {
  ExportadorRelatorio(this._database);

  final AppDatabase _database;

  /// Gera os bytes do relatório da prova [provaId].
  Future<Uint8List> gerarBytes(int provaId) async {
    final notas = await _database.historicoDao.observarNotasDaProva(provaId).first;

    final buffer = StringBuffer()
      ..write('﻿')
      ..writeln('Nome;Matrícula;Acertos;Nota');
    for (final nota in notas) {
      buffer.writeln(
        [
          _campo(nota.nome),
          _campo(nota.matricula ?? ''),
          '${nota.acertos}',
          nota.nota.toStringAsFixed(1).replaceAll('.', ','),
        ].join(';'),
      );
    }
    return Uint8List.fromList(utf8.encode(buffer.toString()));
  }

  /// Grava o relatório da prova [provaId] no [destino] (mantido por compatibilidade).
  Future<void> exportar(int provaId, IOSink destino) async {
    destino.add(await gerarBytes(provaId));
  }

  static String _campo(String valor) => '"${valor.replaceAll('"', '""')}"';
}

/// Nome sugerido para o arquivo exportado, ex.: "Prova_de_Matematica_28-11-2026.csv".
String nomeArquivoRelatorio(String tituloProva, int timestampMs) {
  final data = DateTime.fromMillisecondsSinceEpoch(timestampMs);
  final dia = data.day.toString().padLeft(2, '0');
  final mes = data.month.toString().padLeft(2, '0');
  final ano = data.year;
  final titulo = tituloProva
      .replaceAll(RegExp(r'[<>:"/\\|?*]'), '')
      .trim()
      .replaceAll(' ', '_');
  return '${titulo.isEmpty ? 'Relatorio' : titulo}_$dia-$mes-$ano.csv';
}
