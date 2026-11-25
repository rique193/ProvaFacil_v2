import '../app_database.dart';

class BancoQuestaoComAlternativas {
  const BancoQuestaoComAlternativas({
    required this.questao,
    required this.alternativas,
  });

  final BancoQuestaoEntity questao;
  final List<BancoAlternativaEntity> alternativas;
}