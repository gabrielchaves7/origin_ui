// ignore_for_file: strict_raw_type

import 'package:formz/formz.dart';
import 'package:origin_ui/home/forms/inputs/annual_income_input.dart';
import 'package:origin_ui/home/forms/inputs/monthly_costs_input.dart';

class FinancialWellnessForm with FormzMixin {
  FinancialWellnessForm({
    this.annualIncomeInput = const AnnualIncomeInput.pure(),
    this.monthlyCostsInput = const MonthlyCostsInput.pure(),
  });

  final AnnualIncomeInput annualIncomeInput;
  final MonthlyCostsInput monthlyCostsInput;

  @override
  List<FormzInput> get inputs => [annualIncomeInput, monthlyCostsInput];
}
