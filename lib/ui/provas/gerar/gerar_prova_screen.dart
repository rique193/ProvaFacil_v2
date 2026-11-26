import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/prova_facil_text_field.dart';
import 'gerar_prova_view_model.dart';

class GerarProvaScreen extends StatelessWidget {
  const GerarProvaScreen({
    super.key,
    required this.onVoltar,
    required this.onGerada,
    required this.onAbrirBancoQuestoes,
  });

  final VoidCallback onVoltar;
  final ValueChanged<int> onGerada;
  final VoidCallback onAbrirBancoQuestoes;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<GerarProvaViewModel>();
    final estado = vm.uiState;
    final tema = Theme.of(context);
    final questoes = estado.questoes;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerar prova'),
        leading: IconButton(
          onPressed: onVoltar,
          tooltip: 'Voltar',
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: estado.carregando
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(24),
              children: [
                ProvaFacilTextField(
                  value: estado.titulo,
                  onChanged: vm.atualizarTitulo,
                  label: 'Título da prova',
                  singleLine: true,
                  enabled: !estado.travado,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  key: ValueKey(('disciplina', estado.disciplina)),
                  initialValue: estado.disciplina,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Disciplina',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    for (final d in estado.disciplinas)
                      DropdownMenuItem(value: d.nome, child: Text(d.nome)),
                  ],
                  onChanged: estado.travado ? null : vm.selecionarDisciplina,
                ),
                if (estado.disciplinas.isEmpty)
                  const Text('Nenhuma disciplina cadastrada.'),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  key: ValueKey(('turma', estado.turma)),
                  initialValue: estado.turma,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Turma',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    for (final t in estado.turmas)
                      DropdownMenuItem(value: t.nome, child: Text(t.nome)),
                  ],
                  onChanged: estado.travado ? null : vm.selecionarTurma,
                ),
                if (estado.turmas.isEmpty)
                  const Text('Nenhuma turma cadastrada.'),
                const SizedBox(height: 16),
                ProvaFacilTextField(
                  value: estado.descricao,
                  onChanged: vm.atualizarDescricao,
                  label: 'Descrição (opcional)',
                  enabled: !estado.travado,
                ),
                const SizedBox(height: 24),
                Text('Questões do banco', style: tema.textTheme.titleLarge),
                if (estado.disciplina == null)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('Escolha uma disciplina para ver as questões.'),
                  )
                else if (questoes.isEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('Nenhuma questão cadastrada nesta disciplina.'),
                  ),
                  OutlinedButton.icon(
                    onPressed: estado.travado ? null : onAbrirBancoQuestoes,
                    icon: const Icon(Icons.library_books),
                    label: const Text('Abrir Banco de Questões'),
                  ),
                ] else ...[
                  Text('${estado.selecionadas.length} selecionada(s)'),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Selecionar todas'),
                    value: estado.todasSelecionadas,
                    onChanged: estado.travado
                        ? null
                        : (valor) => vm.selecionarTodas(valor ?? false),
                  ),
                  for (final q in questoes)
                    CheckboxListTile(
                      key: ValueKey(q.questao.id),
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(q.questao.enunciado),
                      value: estado.selecionadas.contains(q.questao.id),
                      onChanged: estado.travado
                          ? null
                          : (valor) => vm.selecionarQuestao(
                              q.questao.id,
                              valor ?? false,
                            ),
                    ),
                ],
                const Divider(height: 32),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Embaralhar questões'),
                  value: estado.embaralharQuestoes,
                  onChanged: estado.travado
                      ? null
                      : vm.alternarEmbaralharQuestoes,
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Embaralhar alternativas'),
                  value: estado.embaralharAlternativas,
                  onChanged: estado.travado
                      ? null
                      : vm.alternarEmbaralharAlternativas,
                ),
                if (estado.erro != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      estado.erro!,
                      style: TextStyle(color: tema.colorScheme.error),
                    ),
                  ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: estado.travado
                      ? null
                      : () async {
                          final id = await vm.gerar();
                          if (id != null && context.mounted) onGerada(id);
                        },
                  icon: estado.gerando
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.shuffle),
                  label: const Text('Gerar prova'),
                ),
              ],
            ),
    );
  }
}
