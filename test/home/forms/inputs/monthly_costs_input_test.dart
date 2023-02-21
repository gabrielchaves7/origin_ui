import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:origin_ui/home/forms/monthly_costs_input.dart';

void main() {
  testWidgets('Formz status should be invalid if monthly income is empty', (tester) async {
    const monthlyCostsInput = MonthlyCostsInput.dirty();
    expect(monthlyCostsInput.valid, equals(false));
    expect(monthlyCostsInput.status, equals(FormzInputStatus.invalid));
  });

  testWidgets('Formz status should be invalid if monthly income is 0', (tester) async {
    const monthlyCostsInput = MonthlyCostsInput.dirty(value: '0');
    expect(monthlyCostsInput.valid, equals(false));
    expect(monthlyCostsInput.status, equals(FormzInputStatus.invalid));
  });
  testWidgets('Formz status should be valid if monthly income is greater than 0', (tester) async {
    const monthlyCostsInput = MonthlyCostsInput.dirty(value: '100');
    expect(monthlyCostsInput.valid, equals(true));
    expect(monthlyCostsInput.status, equals(FormzInputStatus.valid));
  });
}
