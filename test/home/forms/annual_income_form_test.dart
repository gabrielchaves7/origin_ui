import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:origin_ui/home/forms/annual_income_form.dart';

void main() {
  testWidgets('Formz status should be invalid if annual income is empty', (tester) async {
    const annualIncomeInput = AnnualIncomeInput.dirty();
    expect(annualIncomeInput.valid, equals(false));
    expect(annualIncomeInput.status, equals(FormzInputStatus.invalid));
  });

  testWidgets('Formz status should be invalid if annual income is 0', (tester) async {
    const annualIncomeInput = AnnualIncomeInput.dirty(value: '0');
    expect(annualIncomeInput.valid, equals(false));
    expect(annualIncomeInput.status, equals(FormzInputStatus.invalid));
  });
  testWidgets('Formz status should be valid if annual income is greater than 0', (tester) async {
    const annualIncomeInput = AnnualIncomeInput.dirty(value: '100');
    expect(annualIncomeInput.valid, equals(true));
    expect(annualIncomeInput.status, equals(FormzInputStatus.valid));
  });
}
