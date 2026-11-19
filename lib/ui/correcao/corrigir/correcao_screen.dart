import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/prova_facil_card.dart';
import '../../components/prova_facil_text_field.dart';
import '../componentes/letra_alternativa.dart';
import 'correcao_ui_state.dart';
import 'correcao_view_model.dart';

class CorrecaoScreen extends StatefulWidget {
  const CorrecaoScreen({
    super.key,
    required this.onVoltar,
    required this.onCorrigido,
  });
  final VoidCallback onVoltar;
  final ValueChanged<int> onCorrigido;
  @override
  State<CorrecaoScreen> createState() => _CorrecaoScreenState();
}

class _CorrecaoScreenState extends State<CorrecaoScreen> {
  bool _dialogoAberto = false;
  int? _resultadoNavegado;

  void _efeitos(CorrecaoViewModel vm, CorrecaoUiState estado) {
    final resultado = estado.resultadoId;
    if (resultado != null && resultado != _resultadoNavegado) {
      _resultadoNavegado = resultado;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) widget.onCorrigido(resultado);
      });
    }
    final confirmacao = estado.confirmacao;
    if (confirmacao == null || _dialogoAberto) return;
    _dialogoAberto = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final tudoEmBranco = confirmacao.emBranco.length == estado.totalQuestoes;
      final confirmou = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          icon: const Icon(Icons.warning),
          title: Text(
            tudoEmBranco ? 'Folha em branco' : 'Respostas incompletas',
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (tudoEmBranco)
                  const Text(
                    'Nenhuma questão foi marcada. Se corrigir assim, a nota do aluno será 0.',
                  )
                else ...[
                  if (confirmacao.emBranco.isNotEmpty)
                    Text(
                      'Em branco (contam como não respondidas): questão(ões) ${confirmacao.emBranco.join(', ')}.',
                    ),
                  if (confirmacao.marcacaoMultipla.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Mais de uma alternativa marcada (serão anuladas): questão(ões) ${confirmacao.marcacaoMultipla.join(', ')}.',
                      ),
                    ),
                ],
                const SizedBox(height: 8),
                Text(
                  'Confira com a folha antes de corrigir.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Revisar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Corrigir assim mesmo'),
            ),
          ],
        ),
      );
      if (!mounted) return;
      _dialogoAberto = false;
      if (confirmou == true) {
        await vm.confirmarCorrecao();
      } else {
        vm.cancelarConfirmacao();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CorrecaoViewModel>();
    final s = vm.uiState;
    final cores = Theme.of(context).colorScheme;
    _efeitos(vm, s);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corrigir Prova'),
        leading: IconButton(
          tooltip: 'Voltar',
          onPressed: widget.onVoltar,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 8,
        color: cores.surface,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (s.erro != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(s.erro!, style: TextStyle(color: cores.error)),
                  ),
                FilledButton(
                  onPressed: s.corrigindo || s.carregando ? null : vm.corrigir,
                  child: s.corrigindo
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Corrigir Prova'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: s.carregando
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _titulo(context, 'Prova'),
                const SizedBox(height: 8),
                if (s.provas.isEmpty)
                  const Text(
                    'Nenhuma prova cadastrada. Cadastre uma prova e o gabarito antes de corrigir.',
                  )
                else
                  PopupMenuButton<int>(
                    tooltip: 'Escolher prova',
                    enabled: !s.corrigindo,
                    onSelected: vm.selecionarProva,
                    itemBuilder: (_) => [
                      for (final p in s.provas)
                        PopupMenuItem(
                          value: p.provaId,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p.titulo,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${p.disciplina} · ${p.totalQuestoes} questão(ões)',
                              ),
                            ],
                          ),
                        ),
                    ],
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: cores.outline),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.provaSelecionada?.titulo ??
                                      'Selecione a prova',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (s.provaSelecionada case final p?)
                                  Text(
                                    '${p.disciplina} · ${p.totalQuestoes} questão(ões)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall,
                                  ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                _titulo(context, 'Aluno'),
                const SizedBox(height: 8),
                ProvaFacilTextField(
                  value: s.nomeAluno,
                  onChanged: vm.atualizarNomeAluno,
                  label: 'Nome do aluno',
                  singleLine: true,
                  enabled: !s.corrigindo,
                ),
                const SizedBox(height: 8),
                ProvaFacilTextField(
                  value: s.turma,
                  onChanged: vm.atualizarTurma,
                  label: 'Turma (opcional)',
                  singleLine: true,
                  enabled: !s.corrigindo,
                ),
                if (s.provaSelecionada != null) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _titulo(context, 'Respostas do aluno')),
                      Text('${s.respondidas} de ${s.totalQuestoes} marcadas'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Confira com a folha: toque na alternativa que o aluno marcou. Toque de novo para deixar a questão em branco.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (s.questoesSemGabarito.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: cores.errorContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.warning, color: cores.onErrorContainer),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                s.provaSemGabarito
                                    ? 'Esta prova ainda não tem gabarito. Defina as respostas corretas na tela de Gabarito para poder corrigir.'
                                    : 'O gabarito desta prova está incompleto (questão(ões) ${s.questoesSemGabarito.join(', ')}). Defina as respostas corretas na tela de Gabarito para poder corrigir.',
                                style: TextStyle(color: cores.onErrorContainer),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  for (final q in s.questoes)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: _questao(context, vm, q, s.corrigindo),
                    ),
                ],
              ],
            ),
    );
  }

  Widget _titulo(BuildContext context, String texto) => Text(
    texto,
    style: Theme.of(context).textTheme.titleMedium
        ?.copyWith(fontWeight: FontWeight.w600),
  );

  Widget _questao(
    BuildContext context,
    CorrecaoViewModel vm,
    CorrecaoQuestaoState q,
    bool corrigindo,
  ) {
    final tema = Theme.of(context);
    final cores = CoresCorrecao(context);
    return ProvaFacilCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Questão ${q.numero}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  if (q.letrasMarcadas.length > 1 || !q.temGabarito)
                    Text(
                      q.letrasMarcadas.length > 1
                          ? 'Mais de uma marcada'
                          : 'Sem gabarito',
                      style: tema.textTheme.bodySmall?.copyWith(
                        color: tema.colorScheme.error,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Wrap(
              spacing: 6,
              children: [
                for (final letra in q.letras)
                  LetraAlternativa(
                    letra: letra,
                    fundo: q.letrasMarcadas.contains(letra)
                        ? tema.colorScheme.primary
                        : cores.neutro,
                    corTexto: q.letrasMarcadas.contains(letra)
                        ? tema.colorScheme.onPrimary
                        : cores.onNeutro,
                    onClick: corrigindo
                        ? null
                        : () => vm.alternarLetra(q.questaoId, letra),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
