// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeFrontTitle => 'Let\'s find out your ';

  @override
  String get homeFrontTitleBold => 'financial wellness score.';

  @override
  String get homeCardTitle => 'Financial wellness test';

  @override
  String get homeCardSubtitle => 'Enter your financial information bellow';

  @override
  String get homeAnnualIncomeInputLabel => 'Annual income';

  @override
  String get homeMonthlyCostsInputLabel => 'Monthly Costs';

  @override
  String get homeContinueButton => 'Continue';

  @override
  String get homeAnnualIncomeInputInvalidError =>
      'Annual income value is invalid.';

  @override
  String get homeAnnualIncomeInputValueIsZeroError =>
      'Annual income must be greater than zero.';

  @override
  String get homeMonthlyCostsInputInvalidError =>
      'Monthly Costs value is invalid.';

  @override
  String get homeMonthlyCostsInputValueIsZeroError =>
      'Monthly Costs must be greater than zero.';

  @override
  String get homeFooter =>
      'Your financial information is encrypted and secure. We\'ll never share or sell any of your personal data.';

  @override
  String get homeScoreHealthlyTitle => 'Congratulations!';

  @override
  String get homeScoreHealthlySubtitle => 'Your financial wellness score is ';

  @override
  String get homeScoreHealthlySubtitleBold => 'Healthy.';

  @override
  String get homeScoreMediumTitle => 'There is room for improvement.';

  @override
  String get homeScoreMediumSubtitle => 'Your financial wellness score is ';

  @override
  String get homeScoreMediumSubtitleBold => 'Average.';

  @override
  String get homeScoreLowTitle => 'Caution!';

  @override
  String get homeScoreLowSubtitle => 'Your financial wellness score is ';

  @override
  String get homeScoreLowSubtitleBold => 'Unhealthy.';

  @override
  String get homeBackButton => 'Return';

  @override
  String get homeBackTitle => 'Here\'s your ';

  @override
  String get homeBackTitleBold => 'financial wellness score:';

  @override
  String get homeBackErrorText =>
      'Something went wrong while trying to get your financial score.';
}
