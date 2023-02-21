import 'package:formz/formz.dart';

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
}
