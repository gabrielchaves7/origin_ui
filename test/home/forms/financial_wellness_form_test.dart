// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:origin_ui/home/forms/financial_wellness_form.dart';
import 'package:origin_ui/home/forms/inputs/annual_income_input.dart';
import 'package:origin_ui/home/forms/inputs/monthly_costs_input.dart';

void main() {
  testWidgets(
      'Financial wellness form status should be invalid if annual income is empty',
      (tester) async {
    final financialWellnessForm = FinancialWellnessForm(
      annualIncomeInput: const AnnualIncomeInput.dirty(),
      monthlyCostsInput: const MonthlyCostsInput.dirty(value: '1000'),
    );

    expect(financialWellnessForm.status, equals(FormzStatus.invalid));
    expect(financialWellnessForm.annualIncomeInput.status,
        equals(FormzInputStatus.invalid));
    expect(financialWellnessForm.monthlyCostsInput.status,
        equals(FormzInputStatus.valid));
  });

  testWidgets(
      'Financial wellness form status should be invalid if annual income is zero',
      (tester) async {
    final financialWellnessForm = FinancialWellnessForm(
      annualIncomeInput: const AnnualIncomeInput.dirty(value: '1000'),
      monthlyCostsInput: const MonthlyCostsInput.dirty(value: '0'),
    );

    expect(financialWellnessForm.status, equals(FormzStatus.invalid));
    expect(financialWellnessForm.annualIncomeInput.status,
        equals(FormzInputStatus.valid));
    expect(financialWellnessForm.monthlyCostsInput.status,
        equals(FormzInputStatus.invalid));
  });

  testWidgets(
      'Financial wellness form status should be invalid if monthly costs is empty',
      (tester) async {
    final financialWellnessForm = FinancialWellnessForm(
      annualIncomeInput: const AnnualIncomeInput.dirty(value: '1000'),
      monthlyCostsInput: const MonthlyCostsInput.dirty(),
    );

    expect(financialWellnessForm.status, equals(FormzStatus.invalid));
    expect(financialWellnessForm.annualIncomeInput.status,
        equals(FormzInputStatus.valid));
    expect(financialWellnessForm.monthlyCostsInput.status,
        equals(FormzInputStatus.invalid));
  });

  testWidgets(
      'Financial wellness form status should be invalid if monthly costs is zero',
      (tester) async {
    final financialWellnessForm = FinancialWellnessForm(
      annualIncomeInput: const AnnualIncomeInput.dirty(value: '1000'),
      monthlyCostsInput: const MonthlyCostsInput.dirty(value: '0'),
    );

    expect(financialWellnessForm.status, equals(FormzStatus.invalid));
    expect(financialWellnessForm.annualIncomeInput.status,
        equals(FormzInputStatus.valid));
    expect(financialWellnessForm.monthlyCostsInput.status,
        equals(FormzInputStatus.invalid));
  });

  testWidgets(
      'Financial wellness form status should be valid if annual income and monthly costs are valid',
      (tester) async {
    final financialWellnessForm = FinancialWellnessForm(
      annualIncomeInput: const AnnualIncomeInput.dirty(value: '80000'),
      monthlyCostsInput: const MonthlyCostsInput.dirty(value: '500'),
    );

    expect(financialWellnessForm.status, equals(FormzStatus.valid));
    expect(financialWellnessForm.annualIncomeInput.status,
        equals(FormzInputStatus.valid));
    expect(financialWellnessForm.monthlyCostsInput.status,
        equals(FormzInputStatus.valid));
  });
}
