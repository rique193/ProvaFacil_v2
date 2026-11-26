<div align="center">

# ProvaFácil

**Aplicativo Android que ajuda o professor a montar provas de múltipla escolha a partir de um banco de questões, imprimir a prova com folhas de resposta identificadas por QR Code, corrigir lendo o QR com a câmera do celular e acompanhar as notas da turma.**

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

![Status](https://img.shields.io/badge/status-entregue%20N3-2E7D32?style=flat-square)
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
- [9. Funcionalidades da N3](#9-funcionalidades-da-n3)

---

## 1. Visão Geral

*Entrega: N1*

Professores gastam muito tempo montando provas, corrigindo à mão e passando as notas para uma planilha. O **ProvaFácil** automatiza esse trabalho: o professor entra com a própria conta, cadastra turmas, disciplinas e um banco de questões, gera provas a partir do banco (com embaralhamento de questões e alternativas), exporta a prova em PDF com uma folha de respostas com QR Code para cada aluno e, depois da aplicação, lê o QR com a câmera do celular para corrigir. O app calcula a nota de 0 a 10, guarda o histórico, mostra o status da prova e as estatísticas de cada questão e exporta o relatório da turma em Excel (.xlsx).

O app é usado pelo **professor**, no próprio celular Android.

## 2. Requisitos

*Entrega: N1* (ajustados na N2 e na N3)

### 2.1 Funcionais (RF)

| Código | Requisito | Situação |
|---|---|---|
| RF01 | O sistema deve permitir cadastrar, listar, editar e excluir provas (título, disciplina e questões com 5 alternativas, de A a E). | Implementado |
| RF02 | O sistema deve permitir definir a alternativa correta (gabarito) de cada questão. | Implementado |
| RF03 | O sistema deve permitir cadastrar, listar, editar e excluir alunos (nome, turma, matrícula e e-mail). | Implementado |
| RF04 | O sistema deve identificar a prova, o aluno e a turma pela leitura de um QR Code no formato `PROVAFACIL\|1\|<idProva>\|<aluno>\|<turma>`, com a câmera do celular (e um modo de teste simulado). | Implementado |
| RF05 | O sistema deve conferir as respostas da folha com o gabarito, avisando sobre questões em branco, marcações múltiplas (anuladas) e letras inexistentes, e pedir confirmação antes de corrigir uma folha incompleta. | Implementado |
| RF06 | O sistema deve calcular a nota de 0 a 10 proporcional aos acertos e salvar o resultado de cada aluno. | Implementado |
| RF07 | O sistema deve mostrar o resultado individual (nota, percentual, acertos, erros e em branco), com filtro por situação da questão. | Implementado |
| RF08 | O sistema deve mostrar o histórico das provas corrigidas, com a média da turma. | Implementado |
| RF09 | O sistema deve mostrar as estatísticas da prova: média, maior e menor nota e o percentual de acerto de cada questão. | Implementado |
| RF10 | O sistema deve gerar o relatório de notas e exportá-lo em .xlsx, com as abas "Notas" e "Estatísticas". | Implementado |
| RF11 | O sistema deve enviar os alunos e os resultados para o Firebase Firestore como backup. | Implementado |
| RF12 | O sistema deve permitir criar conta de professor e fazer login (Firebase Authentication, e-mail e senha). | Implementado |
| RF13 | O sistema deve permitir cadastrar turmas e disciplinas. | Implementado |
| RF14 | O sistema deve manter um banco de questões reutilizáveis. | Implementado |
| RF15 | O sistema deve gerar uma prova selecionando questões do banco, com embaralhamento de questões e de alternativas. | Implementado |
| RF16 | O sistema deve exportar a prova em PDF: caderno de questões e, em páginas separadas, uma folha de respostas com QR Code para cada aluno escolhido. | Implementado |
| RF17 | O sistema deve corrigir a prova impressa lendo o QR Code com a câmera do celular; o professor marca na tela as respostas da folha e o app calcula e salva a nota. | Implementado |
| RF18 | O sistema deve mostrar o status de cada prova (Pendente, Em correção, Corrigida) e quantos alunos da turma já foram corrigidos. | Implementado |

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

1. **Login e Criar conta:** entrada do professor com e-mail e senha (Firebase Authentication).
2. **Lista de Provas ("Dashboard" na barra do app):** tela inicial, com as provas, o status de cada uma ("Pendente", "Em correção · X de Y", "Corrigida") e os atalhos para nova prova, turmas e disciplinas, banco de questões, alunos, histórico e o menu da conta (Sair).
3. **Turmas e Disciplinas:** cadastro e exclusão de turmas e disciplinas, em duas abas.
4. **Banco de Questões:** lista com filtro por disciplina e formulário da questão (enunciado, 5 alternativas e a correta).
5. **Gerar Prova:** título, disciplina e turma, seleção das questões do banco e embaralhamento de questões e de alternativas.
6. **Visualizar Prova:** questões e alternativas da prova, com a correta destacada, e os atalhos para editar, gabarito, PDF e corrigir.
7. **Formulário de Prova e Gabarito:** edição manual da prova e marcação da alternativa correta.
8. **Exportar PDF:** escolha dos alunos e visualização/compartilhamento do PDF (caderno + uma folha de respostas com QR por aluno).
9. **Ler QR Code:** leitura do QR da folha impressa com a câmera (ou modo de teste).
10. **Ler Respostas / Correção:** marcação das respostas da folha e confirmação da correção.
11. **Resultado:** nota, percentual e detalhe por questão.
12. **Alunos:** cadastro de alunos por turma.
13. **Histórico, Estatísticas e Relatório de Notas:** provas corrigidas, média, maior e menor nota, acerto por questão, status da prova, alunos que faltam corrigir e exportação em .xlsx.

> Prints das telas em `docs/telas/`.

## 4. Modelo de Dados

*Entrega: N3*

As contas dos professores ficam no **Firebase Authentication** (e-mail e senha). Os dados do app ficam no banco local do aparelho (SQLite com `drift`, versão 2 do esquema), com as tabelas `provas` (com `turma`), `questoes`, `alternativas`, `alunos`, `resultados`, `respostas_aluno`, `turmas`, `disciplinas`, `banco_questoes` e `banco_alternativas`. Alunos e resultados são enviados como backup para o Firestore, em duas coleções. Os ids dos documentos começam pelo id da instalação do app, para os dados de aparelhos diferentes não se sobrescreverem.

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

> Turmas, disciplinas e o banco de questões ficam só no banco local; não há coleções novas no Firestore.

## 5. Stack Tecnológica

*Entrega: N1* (atualizada na N3)

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black)

- **Flutter / Dart:** interface e navegação do app.
- **Firebase Firestore** (`firebase_core`, `cloud_firestore`): backup dos alunos e resultados na nuvem.
- **Firebase Authentication** (`firebase_auth`): cadastro e login do professor.
- **mobile_scanner:** leitura do QR Code com a câmera.
- **drift** (`drift`, `drift_flutter`): banco local SQLite, com as tabelas e relações do app.
- **provider:** estado das telas (`ChangeNotifier`).
- **go_router:** navegação entre as telas.
- **freezed:** classes imutáveis para os estados das telas e os dados.
- **rxdart:** combinação dos streams do banco.
- **intl:** datas e números no formato brasileiro.
- **archive:** geração do arquivo .xlsx.
- **file_picker:** salvar o relatório exportado.
- **pdf / printing:** geração, visualização e compartilhamento da prova em PDF.
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
    prova/             #   embaralhamento e status da prova
    auth/              #   validações do login e do cadastro
    scanner/           #   leitura e geração do QR Code
  data/
    local/             # banco SQLite (drift): tabelas, DAOs e relações
    backup/            # envio para o Firebase Firestore
    auth/              # serviço de autenticação (Firebase Authentication)
    exportacao/        # relatório .xlsx e PDF da prova
    repository/        # acesso aos dados usado pelas telas
  ui/
    theme/             # cores e tipografia (tema claro e escuro)
    navigation/        # rotas do app
    components/        # componentes reutilizáveis
    auth/              # login, criar conta e menu do professor
    turmas_disciplinas/ # cadastro de turmas e disciplinas
    banco_questoes/    # banco de questões e formulário da questão
    provas/            # lista, gerar, visualizar, formulário, gabarito e PDF
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

- A configuração do Firebase (`android/app/google-services.json` e `lib/firebase_options.dart`) já está no repositório. O login por e-mail e senha precisa estar ativado no console (Authentication → Sign-in method).
- A leitura do QR usa a câmera: teste num celular de verdade e permita o acesso à câmera na primeira vez.
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
- **N3:** login do professor, turmas e disciplinas, banco de questões, geração de prova com embaralhamento, visualização da prova, PDF com folha de respostas e QR por aluno, correção lendo o QR com a câmera e status da prova.
  - Situação atual: `flutter analyze` sem avisos e testes automatizados passando.

## 9. Funcionalidades da N3

*Entrega: N3*, em **26/11/2026**, apresentações de 26/11 a 03/12

Roteiro da apresentação (Avaliação N3) e onde cada item está no app:

| # | Funcionalidade | Pontos | Situação | Onde fica |
|---|---|---|---|---|
| 1 | Criar conta (cadastro de professor) | 0,5 | Implementado | Tela de login → "Criar conta" (Firebase Authentication) |
| 2 | Fazer login | 0,5 | Implementado | Tela de login; o app só abre com professor logado; "Sair" no menu da conta |
| 3 | Criar turma / disciplina | 0,75 | Implementado | Lista de provas → ícone "Turmas e disciplinas" |
| 4 | Criar questões no banco de questões | 1,0 | Implementado | Lista de provas → ícone "Banco de questões" |
| 5 | Gerar prova a partir do banco, com embaralhamento | 1,25 | Implementado | "Nova Prova" → "Gerar prova do banco"; o embaralhamento é feito uma vez e gravado, com o gabarito já marcado |
| 6 | Ver a prova gerada e editar | 0,75 | Implementado | Tocar no card da prova abre a visualização; "Editar" abre o formulário |
| 7 | Exportar PDF: questões + gabarito com QR Code em página separada | 2,0 | Implementado | Ícone de PDF → escolher alunos → Visualizar/Compartilhar. Caderno sem QR e uma folha de respostas por aluno, com QR `PROVAFACIL\|1\|<idProva>\|<aluno>\|<turma>` e grade A–E |
| 8 | Corrigir a prova lendo o QR Code | 2,5 | Implementado | "Corrigir" → Ler QR Code (câmera) → o QR identifica prova, aluno e turma → o professor marca as respostas da folha na tela → a nota é exibida e salva |
| 9 | Status da prova após as correções (Relatório) | 0,75 | Implementado | Status no card da lista e no Relatório de Notas (X de Y alunos corrigidos e quem falta), com exportação .xlsx |

**Como funciona a correção:** o QR Code da folha impressa identifica a prova, o aluno e a turma. Depois da leitura, o professor marca na tela as alternativas que o aluno preencheu na folha, e o app compara com o gabarito gravado, calcula a nota de 0 a 10 e salva o resultado. Há também um modo de teste, com folhas simuladas, para demonstrar sem papel.

**Preparação para a apresentação:**
- Prova criada antes no celular da apresentação, a partir do banco, com turma e alunos cadastrados.
- Impressos: 1 caderno de questões e 2 folhas de respostas com QR Code.
- Questões já cadastradas no banco (uma nova é cadastrada ao vivo).

---

<div align="center">

*Projeto acadêmico da disciplina de Desenvolvimento de Dispositivos Móveis*

</div>
