<div align="center">

# ProvaFácil

**Aplicativo Android que ajuda o professor a cadastrar provas de múltipla escolha, corrigir as folhas de resposta dos alunos e acompanhar as notas e estatísticas da turma.**

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-F5A623?style=flat-square)
![Entrega](https://img.shields.io/badge/entrega%20atual-N3-3D348B?style=flat-square)
![Licença](https://img.shields.io/badge/licença-uso%20acadêmico-7B4FA6?style=flat-square)

</div>

## Equipe

| Nome completo |
|---|
| Felipe Faes |
| Habner Kaynan |
| Luiz Henrique Borges Silveira |
| Felipe Gabriel Wroblewski |
| Jackson Rafael |

## Sumário

- [1. Visão Geral](#1-visão-geral)
- [2. Requisitos](#2-requisitos)
  - [2.1 Funcionais (RF)](#21-funcionais-rf)
  - [2.2 Não Funcionais (RNF)](#22-não-funcionais-rnf)
- [3. Telas do Sistema](#3-telas-do-sistema)
- [4. Modelo de Dados](#4-modelo-de-dados)
- [5. Stack Tecnológica](#5-stack-tecnológica)
- [6. Estrutura de Pastas](#6-estrutura-de-pastas)
- [7. Como Executar o Projeto](#7-como-executar-o-projeto)
- [8. Histórico do Projeto](#8-histórico-do-projeto)
- [9. Próximas Etapas (N3)](#9-próximas-etapas-n3)

---

## 1. Visão Geral

*Entrega: N1*

Professores gastam muito tempo corrigindo provas de múltipla escolha à mão e depois passando as notas para uma planilha. O **ProvaFácil** automatiza esse trabalho: o professor cadastra a prova e o gabarito, lê a folha de respostas do aluno (identificada por um QR Code), e o app corrige, calcula a nota de 0 a 10, guarda o histórico, mostra as estatísticas de cada questão e exporta o relatório da turma em Excel (.xlsx).

O app é usado pelo **professor**, no próprio celular Android.

## 2. Requisitos

*Entrega: N1* (ajustados na N2 e na N3)

### 2.1 Funcionais (RF)

| Código | Requisito | Situação |
|---|---|---|
| RF01 | O sistema deve permitir cadastrar, listar, editar e excluir provas (título, disciplina e questões com 5 alternativas, de A a E). | Implementado |
| RF02 | O sistema deve permitir definir a alternativa correta (gabarito) de cada questão. | Implementado |
| RF03 | O sistema deve permitir cadastrar, listar, editar e excluir alunos (nome, turma, matrícula e e-mail). | Implementado |
| RF04 | O sistema deve identificar a prova, o aluno e a turma pela leitura de um QR Code no formato `PROVAFACIL\|1\|<idProva>\|<aluno>\|<turma>`. | Parcial: leitura simulada; câmera real na N3 |
| RF05 | O sistema deve conferir as respostas da folha com o gabarito, avisando sobre questões em branco, marcações múltiplas (anuladas) e letras inexistentes, e pedir confirmação antes de corrigir uma folha incompleta. | Implementado |
| RF06 | O sistema deve calcular a nota de 0 a 10 proporcional aos acertos e salvar o resultado de cada aluno. | Implementado |
| RF07 | O sistema deve mostrar o resultado individual (nota, percentual, acertos, erros e em branco), com filtro por situação da questão. | Implementado |
| RF08 | O sistema deve mostrar o histórico das provas corrigidas, com a média da turma. | Implementado |
| RF09 | O sistema deve mostrar as estatísticas da prova: média, maior e menor nota e o percentual de acerto de cada questão. | Implementado |
| RF10 | O sistema deve gerar o relatório de notas e exportá-lo em .xlsx, com as abas "Notas" e "Estatísticas". | Implementado |
| RF11 | O sistema deve enviar os alunos e os resultados para o Firebase Firestore como backup. | Implementado |
| RF12 | O sistema deve permitir criar conta de professor e fazer login. | Previsto para a N3 |
| RF13 | O sistema deve permitir cadastrar turmas e disciplinas. | Previsto para a N3 |
| RF14 | O sistema deve manter um banco de questões reutilizáveis. | Previsto para a N3 |
| RF15 | O sistema deve gerar uma prova selecionando questões do banco, com embaralhamento de questões e de alternativas. | Previsto para a N3 |
| RF16 | O sistema deve exportar a prova em PDF: folha de questões e, em página separada, o gabarito com QR Code. | Previsto para a N3 |
| RF17 | O sistema deve corrigir a prova impressa lendo o QR Code com a câmera do celular. | Previsto para a N3 |

### 2.2 Não Funcionais (RNF)

| Código | Requisito |
|---|---|
| RNF01 | O app deve ser construído em **Flutter/Dart**, com interface em **Material Design 3** e tema claro e escuro. |
| RNF02 | O app deve rodar em Android 8.0 (API 26) ou superior. |
| RNF03 | O código deve seguir a separação em camadas (domínio, dados e interface), com o estado das telas em `ChangeNotifier` (`provider`). |
| RNF04 | Os dados devem ficar salvos no aparelho (SQLite com `drift`) e ter backup no **Firebase Firestore**. |
| RNF05 | O relatório exportado deve abrir no Excel sem pedido de reparo, com nota com 1 casa decimal e média com 2, com vírgula. |
| RNF06 | O projeto deve passar no `flutter analyze` sem avisos e ter testes automatizados das regras de negócio. |

## 3. Telas do Sistema

*Entrega: N1*

Telas na ordem em que o professor navega. Os prints ficam em `docs/telas/`.

1. **Lista de Provas:** tela inicial, com as provas cadastradas e os atalhos para nova prova, gabarito, correção, alunos e histórico.
   `![Lista de provas](docs/telas/lista-provas.png)`
2. **Formulário de Prova:** criação e edição da prova e das questões.
   `![Formulário de prova](docs/telas/formulario-prova.png)`
3. **Gabarito:** marcação da alternativa correta de cada questão, com o progresso.
   `![Gabarito](docs/telas/gabarito.png)`
4. **Ler QR Code:** identificação da prova, do aluno e da turma.
   `![Ler QR Code](docs/telas/ler-qr.png)`
5. **Ler Respostas:** marcações lidas da folha do aluno.
   `![Ler respostas](docs/telas/ler-respostas.png)`
6. **Correção:** conferência das marcações e confirmação da correção.
   `![Correção](docs/telas/correcao.png)`
7. **Resultado:** nota, percentual e detalhe por questão.
   `![Resultado](docs/telas/resultado.png)`
8. **Alunos:** cadastro e lista de alunos por turma.
   `![Alunos](docs/telas/alunos.png)`
9. **Histórico:** provas corrigidas, com a média da turma.
   `![Histórico](docs/telas/historico.png)`
10. **Estatísticas:** média, maior e menor nota e o percentual de acerto por questão.
    `![Estatísticas](docs/telas/estatisticas.png)`
11. **Relatório de Notas:** notas dos alunos e exportação em .xlsx.
    `![Relatório](docs/telas/relatorio.png)`

> Para inserir os prints, salve as imagens em `docs/telas/` e tire as crases das linhas acima.

## 4. Modelo de Dados

*Entrega: N3*

Os dados ficam no banco local do aparelho (SQLite, com as tabelas `provas`, `questoes`, `alternativas`, `alunos`, `resultados` e `respostas_aluno`) e são enviados como backup para o Firestore, em duas coleções. Os ids dos documentos começam pelo id da instalação do app, para os dados de aparelhos diferentes não se sobrescreverem.

```json
// Coleção: alunos   (id do documento: {idInstalacao}_{alunoId})
{
  "idInstalacao": "3f2c9a10-...",
  "alunoId": 1,
  "nome": "Maria Silva",
  "turma": "Turma A",
  "matricula": "2026001",
  "email": "maria@email.com",
  "atualizadoEm": 1795120000000
}
```

| Campo | Tipo | Descrição |
|---|---|---|
| idInstalacao | String | Identificador da instalação do app que enviou o dado |
| alunoId | Number | Id do aluno no banco local |
| nome | String | Nome do aluno |
| turma | String | Turma, no formato "Turma X" |
| matricula | String / null | Matrícula do aluno |
| email | String / null | E-mail do aluno |
| atualizadoEm | Number | Data do envio, em milissegundos |

```json
// Coleção: resultados   (id do documento: {idInstalacao}_{provaId}_{alunoId})
{
  "idInstalacao": "3f2c9a10-...",
  "prova": { "id": 1, "titulo": "Prova de Matemática", "disciplina": "Matemática" },
  "aluno": { "id": 1, "nome": "Maria Silva", "turma": "Turma A", "matricula": "2026001" },
  "totalQuestoes": 10,
  "acertos": 8,
  "erros": 1,
  "emBranco": 1,
  "nota": 8.0,
  "notaMaxima": 10.0,
  "corrigidoEm": 1795120000000,
  "atualizadoEm": 1795120000000,
  "respostas": [
    { "numero": 1, "questaoId": 1, "letrasMarcadas": "B", "letraCorreta": "B", "situacao": "ACERTO" }
  ]
}
```

| Campo | Tipo | Descrição |
|---|---|---|
| idInstalacao | String | Identificador da instalação do app |
| prova | Map | Id, título e disciplina da prova |
| aluno | Map | Id, nome, turma e matrícula do aluno |
| totalQuestoes | Number | Quantidade de questões da prova |
| acertos / erros / emBranco | Number | Totais da correção (marcação múltipla conta como erro) |
| nota / notaMaxima | Number | Nota obtida e nota máxima (10) |
| corrigidoEm | Number | Data da correção, em milissegundos |
| atualizadoEm | Number | Data do envio, em milissegundos |
| respostas | Array | Por questão: número, letras marcadas, letra correta e situação (`ACERTO`, `ERRO`, `EM_BRANCO` ou `MARCACAO_MULTIPLA`) |

> Na N3 entram as coleções novas de professores, turmas/disciplinas e banco de questões (ver seção 9).

## 5. Stack Tecnológica

*Entrega: N1* (atualizada na N3)

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black)

- **Flutter / Dart:** interface e navegação do app.
- **Firebase Firestore** (`firebase_core`, `cloud_firestore`): backup dos alunos e resultados na nuvem.
- **drift** (`drift`, `drift_flutter`): banco local SQLite, com as tabelas e relações do app.
- **provider:** estado das telas (`ChangeNotifier`).
- **go_router:** navegação entre as telas.
- **freezed:** classes imutáveis para os estados das telas e os dados.
- **rxdart:** combinação dos streams do banco.
- **intl:** datas e números no formato brasileiro.
- **archive:** geração do arquivo .xlsx.
- **file_picker:** salvar o relatório exportado.
- **pdf / printing:** geração da prova em PDF.
- **shared_preferences / uuid:** id da instalação usado no backup.

## 6. Estrutura de Pastas

*Entrega: N1*, atualizada conforme o projeto cresce

```
lib/
  main.dart            # inicialização do app, Firebase e banco
  util/                # formatação de números, comparação de textos e mensagens de erro
  domain/              # regras de negócio, sem banco nem tela
    aluno/             #   validação de aluno e formato da turma
    correcao/          #   correção, nota e validações da folha
    estatisticas/      #   cálculo das estatísticas por questão
    historico/         #   resumo das notas e formato das turmas
    model/             #   dados de entrada do formulário de prova
    scanner/           #   leitura e geração do QR Code
  data/
    local/             # banco SQLite (drift): tabelas, DAOs e relações
    backup/            # envio para o Firebase Firestore
    exportacao/        # geração do relatório .xlsx
    repository/        # acesso aos dados usado pelas telas
  ui/
    theme/             # cores e tipografia (tema claro e escuro)
    navigation/        # rotas do app
    components/        # componentes reutilizáveis
    provas/            # lista, formulário e gabarito
    scanner/           # leitura do QR Code e das respostas
    correcao/          # correção e resultado
    alunos/            # cadastro de alunos
    historico/         # histórico das correções
    estatisticas/      # estatísticas da prova
    relatorio/         # relatório de notas e exportação
test/                  # testes automatizados, na mesma estrutura de lib/
android/               # projeto Android gerado pelo Flutter
docs/
  telas/               # prints das telas
  modelo-dados/
  backlog/
```

## 7. Como Executar o Projeto

*Entrega: N1*, revisado a cada entrega

**Pré-requisitos:** Flutter 3.47 ou superior, Android SDK (API 26+) e um celular Android com depuração USB ativada ou um emulador.

```
1. git clone https://github.com/rique193/ProvaFacil_v2.git
2. cd ProvaFacil_v2
3. flutter pub get
4. flutter run
```

- A configuração do Firebase (`android/app/google-services.json` e `lib/firebase_options.dart`) já está no repositório. Não é preciso configurar nada.
- Os arquivos gerados (`*.g.dart` e `*.freezed.dart`) também já estão no repositório. Se alterar alguma classe de dados, gere de novo com `dart run build_runner build`.
- Para gerar o APK: `flutter build apk --release`. O arquivo fica em `build/app/outputs/flutter-apk/`.
- Para rodar os testes: `flutter test`.

**Observação para Windows:** o `android/gradle.properties` desativa a compilação incremental do Kotlin (`kotlin.incremental=false`), porque sem isso o build falha com "Storage ... is already registered". Se usar o VS Code, desative a extensão "Language Support for Java", que interfere no Gradle da pasta `android/`.

## 8. Histórico do Projeto

*Entrega: N2*

- **N1:** telas navegáveis com dados fictícios (mock).
- **N2:** primeira versão feita em Kotlin + Jetpack Compose, com banco local (Room) e backup no Firebase Firestore.
- **Conversão para Flutter (novembro/2026):** como a disciplina exige Flutter, o app foi convertido inteiro de Kotlin para Flutter/Dart neste repositório, mantendo as mesmas telas, regras de negócio e formato dos dados no Firestore. O código Kotlin original continua no repositório antigo ([rique193/ProvaFacil](https://github.com/rique193/ProvaFacil)), só como referência.
  - Fase 0: base do projeto (pacotes, tema, banco, rotas).
  - Fase 1: cada membro portou a sua frente (Provas, Scanner, Alunos, Correção, Histórico/Estatísticas/Relatório), com PR e revisão.
  - Fase 2: integração, correções e testes do fluxo completo no celular.
  - Situação atual: `flutter analyze` sem avisos e mais de 300 testes automatizados passando.

## 9. Próximas Etapas (N3)

*Entrega: N3*, em **26/11/2026**, apresentações de 26/11 a 03/12

A apresentação segue o roteiro da Avaliação N3. A tabela mostra o que já existe e o que falta para cada item.

| # | Funcionalidade | Pontos | Situação | O que falta |
|---|---|---|---|---|
| 1 | Criar conta (cadastro de professor) | 0,5 | A fazer | Tela de cadastro com Firebase Authentication (e-mail e senha) |
| 2 | Fazer login | 0,5 | A fazer | Tela de login e sessão do professor; cada professor vê só os próprios dados |
| 3 | Criar turma / disciplina | 0,75 | Parcial | Hoje turma e disciplina são campos de texto; falta o cadastro próprio e a escolha na prova e no aluno |
| 4 | Criar questões no banco de questões | 1,0 | A fazer | Banco de questões separado da prova, com enunciado, 5 alternativas e a correta, por disciplina |
| 5 | Gerar prova a partir do banco, com embaralhamento | 1,25 | A fazer | Selecionar questões do banco e embaralhar a ordem das questões e das alternativas, guardando o gabarito de cada versão |
| 6 | Ver a prova gerada e editar | 0,75 | Pronto | Lista de provas e formulário de edição já funcionam |
| 7 | Exportar PDF: questões + gabarito com QR Code em página separada | 2,0 | Parcial | O PDF existe, mas o QR precisa usar o formato `PROVAFACIL\|1\|<idProva>\|<aluno>\|<turma>` e o gabarito precisa ficar em página separada, com uma folha por aluno |
| 8 | Corrigir a prova lendo o QR Code | 2,5 | Parcial | A correção, a nota e o salvamento já funcionam; falta ler o QR impresso com a câmera do celular (`mobile_scanner`) |
| 9 | Status da prova após as correções (Relatório) | 0,75 | Pronto | Histórico, Estatísticas e Relatório com exportação .xlsx |

**Preparação para a apresentação:**
- [ ] Criar uma prova no app antes do dia, com questões do banco.
- [ ] Imprimir 1 caderno de questões e 2 cópias do gabarito com QR Code.
- [ ] Deixar questões já cadastradas no banco de questões.
- [ ] Estender as regras do Firestore para depois de 03/12 (hoje expiram em 27/11).
- [ ] Testar o roteiro completo no celular e gerar o APK final.
- [ ] Atualizar este README com os prints das telas novas.

**Ordem de trabalho, por pontuação:** itens 7 e 8 (4,5 pontos) → itens 4 e 5 (2,25 pontos) → itens 1, 2 e 3 (1,75 pontos).

---

<div align="center">

*Projeto acadêmico da disciplina de Desenvolvimento de Dispositivos Móveis*

</div>
