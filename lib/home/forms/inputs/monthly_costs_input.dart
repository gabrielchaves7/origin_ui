import 'package:formz/formz.dart';

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
}
