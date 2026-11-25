import 'package:flutter/material.dart';

import '../../../data/local/app_database.dart';

enum AcaoPdf { visualizar, compartilhar }

class SelecaoAlunosPdf {
  const SelecaoAlunosPdf(this.acao, this.alunos);
  final AcaoPdf acao;
  final List<AlunoEntity> alunos;
}

/// Pergunta para quais alunos gerar a folha de respostas e o que fazer com o PDF.
/// Devolve `null` se o professor cancelar.
Future<SelecaoAlunosPdf?> escolherAlunosDoPdf(
  BuildContext context, {
  required List<AlunoEntity> alunos,
  required String turma,
}) => showDialog<SelecaoAlunosPdf>(
  context: context,
  builder: (_) => _SelecaoAlunosPdfDialog(alunos: alunos, turma: turma),
);

class _SelecaoAlunosPdfDialog extends StatefulWidget {
  const _SelecaoAlunosPdfDialog({required this.alunos, required this.turma});

  final List<AlunoEntity> alunos;
  final String turma;

  @override
  State<_SelecaoAlunosPdfDialog> createState() =>
      _SelecaoAlunosPdfDialogState();
}

class _SelecaoAlunosPdfDialogState extends State<_SelecaoAlunosPdfDialog> {
  late final Set<int> _marcados = {for (final aluno in widget.alunos) aluno.id};

  List<AlunoEntity> get _selecionados => [
    for (final aluno in widget.alunos)
      if (_marcados.contains(aluno.id)) aluno,
  ];

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final semAlunos = widget.alunos.isEmpty;
    final todos = _marcados.length == widget.alunos.length;
    final podeGerar = _marcados.isNotEmpty;

    return AlertDialog(
      title: const Text('Gerar PDF da prova'),
      content: SizedBox(
        width: double.maxFinite,
        child: semAlunos
            ? Text(
                widget.turma.trim().isEmpty
                    ? 'Nenhum aluno cadastrado. Cadastre os alunos para gerar as folhas de respostas.'
                    : 'Nenhum aluno cadastrado na ${widget.turma.trim()}. Cadastre os alunos para gerar as folhas de respostas.',
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.turma.trim().isEmpty
                        ? 'Uma folha de respostas com QR Code será criada para cada aluno marcado.'
                        : '${widget.turma.trim()}: uma folha de respostas com QR Code será criada para cada aluno marcado.',
                    style: tema.textTheme.bodySmall,
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      'Selecionar todos',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    value: todos ? true : (podeGerar ? null : false),
                    tristate: true,
                    onChanged: (_) => setState(() {
                      if (todos) {
                        _marcados.clear();
                      } else {
                        _marcados.addAll(widget.alunos.map((a) => a.id));
                      }
                    }),
                  ),
                  const Divider(height: 1),
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (final aluno in widget.alunos)
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(aluno.nome),
                            subtitle: aluno.turma.trim().isEmpty
                                ? null
                                : Text(aluno.turma),
                            value: _marcados.contains(aluno.id),
                            onChanged: (marcado) => setState(() {
                              if (marcado ?? false) {
                                _marcados.add(aluno.id);
                              } else {
                                _marcados.remove(aluno.id);
                              }
                            }),
                          ),
                      ],
                    ),
                  ),
                  if (!podeGerar)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Selecione ao menos um aluno.',
                        style: tema.textTheme.bodySmall?.copyWith(
                          color: tema.colorScheme.error,
                        ),
                      ),
                    ),
                ],
              ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(semAlunos ? 'Fechar' : 'Cancelar'),
        ),
        if (!semAlunos) ...[
          OutlinedButton(
            onPressed: podeGerar
                ? () => Navigator.pop(
                    context,
                    SelecaoAlunosPdf(AcaoPdf.compartilhar, _selecionados),
                  )
                : null,
            child: const Text('Compartilhar'),
          ),
          FilledButton(
            onPressed: podeGerar
                ? () => Navigator.pop(
                    context,
                    SelecaoAlunosPdf(AcaoPdf.visualizar, _selecionados),
                  )
                : null,
            child: const Text('Visualizar'),
          ),
        ],
      ],
    );
  }
}
