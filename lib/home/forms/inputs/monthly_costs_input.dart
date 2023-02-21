import 'package:formz/formz.dart';
import 'package:origin_ui/l10n/l10n.dart';

enum MonthlyCostsInputError { invalid, valueIsZero }

class MonthlyCostsInput extends FormzInput<String, MonthlyCostsInputError> {
  const MonthlyCostsInput.pure() : super.pure('');
  const MonthlyCostsInput.dirty({String value = ''}) : super.dirty(value);

  @override
  MonthlyCostsInputError? validator(String value) {
    try {
      MonthlyCostsInputError? monthlyCostsInputError;

      final monthlyCosts = double.tryParse(value);
      if (monthlyCosts! <= 0) {
        monthlyCostsInputError = MonthlyCostsInputError.valueIsZero;
      }

      return monthlyCostsInputError;
    } catch (e) {
      return MonthlyCostsInputError.invalid;
    }
  }

  String? errorText(AppLocalizations l10n) {
    String? errorText;
    if (pure) {
      errorText = null;
    } else if (error == MonthlyCostsInputError.invalid) {
      errorText = l10n.homeMonthlyCostsInputInvalidError;
    } else if (error == MonthlyCostsInputError.valueIsZero) {
      errorText = l10n.homeMonthlyCostsInputValueIsZeroError;
    }

    return errorText;
  }
}
