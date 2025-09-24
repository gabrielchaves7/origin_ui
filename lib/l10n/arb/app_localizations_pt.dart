// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get homeFrontTitle => 'Vamos descobrir a sua ';

  @override
  String get homeFrontTitleBold => 'pontuação de saúde financeira.';

  @override
  String get homeCardTitle => 'Teste de saúde financeira';

  @override
  String get homeCardSubtitle =>
      'Coloque as suas informações financeiras abaixo';

  @override
  String get homeAnnualIncomeInputLabel => 'Salário anual';

  @override
  String get homeMonthlyCostsInputLabel => 'Gastos mensais';

  @override
  String get homeContinueButton => 'Continuar';

  @override
  String get homeAnnualIncomeInputInvalidError =>
      'O salário anual informado é inválido.';

  @override
  String get homeAnnualIncomeInputValueIsZeroError =>
      'O salário anual deve ser maior que zero.';

  @override
  String get homeMonthlyCostsInputInvalidError =>
      'Os gastos mensais informado é inválido.';

  @override
  String get homeMonthlyCostsInputValueIsZeroError =>
      'Os gastos mensais deve ser maior que zero.';

  @override
  String get homeFooter =>
      'Os seus dados financeiros são criptografados de maneira segura. Nunca compartilhamos ou vendemos os seus dados pessoais';

  @override
  String get homeScoreHealthlyTitle => 'Parabéns!';

  @override
  String get homeScoreHealthlySubtitle => 'A sua saúde financeira está ';

  @override
  String get homeScoreHealthlySubtitleBold => 'Saudável.';

  @override
  String get homeScoreMediumTitle => 'Poderia ser melhor.';

  @override
  String get homeScoreMediumSubtitle =>
      'A sua saúde financeira está dentro da ';

  @override
  String get homeScoreMediumSubtitleBold => 'Média.';

  @override
  String get homeScoreLowTitle => 'Cuidado!';

  @override
  String get homeScoreLowSubtitle => 'A sua saúde financeira está ';

  @override
  String get homeScoreLowSubtitleBold => 'Ruim.';

  @override
  String get homeBackButton => 'Voltar';

  @override
  String get homeBackTitle => 'Aqui está a sua ';

  @override
  String get homeBackTitleBold => 'pontuação de saúde financeira.';

  @override
  String get homeBackErrorText =>
      'Algo deu errado ao tentar calcular a sua pontuação de saúde financeira.';
}
