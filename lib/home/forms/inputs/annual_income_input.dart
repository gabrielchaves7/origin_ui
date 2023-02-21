import 'package:formz/formz.dart';
import 'package:origin_ui/l10n/l10n.dart';

enum AnnualIncomeInputError { invalid, valueIsZero }

class AnnualIncomeInput extends FormzInput<String, AnnualIncomeInputError> {
  const AnnualIncomeInput.pure() : super.pure('');
  const AnnualIncomeInput.dirty({String value = ''}) : super.dirty(value);

  @override
  AnnualIncomeInputError? validator(String value) {
    try {
      AnnualIncomeInputError? annualIncomeInputError;

      final annualIncome = double.tryParse(value);
      if (annualIncome! <= 0) {
        annualIncomeInputError = AnnualIncomeInputError.valueIsZero;
      }

      return annualIncomeInputError;
    } catch (e) {
      return AnnualIncomeInputError.invalid;
    }
  }

  String? errorText(AppLocalizations l10n) {
    String? errorText;
    if (pure) {
      errorText = null;
    } else if (error == AnnualIncomeInputError.invalid) {
      errorText = l10n.homeAnnualIncomeInputInvalidError;
    } else if (error == AnnualIncomeInputError.valueIsZero) {
      errorText = l10n.homeAnnualIncomeInputValueIsZeroError;
    }

    return errorText;
  }
}
