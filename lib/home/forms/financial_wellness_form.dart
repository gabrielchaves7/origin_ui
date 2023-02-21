import 'package:formz/formz.dart';
import 'package:origin_ui/home/forms/annual_income_form.dart';
import 'package:origin_ui/home/forms/monthly_costs_form.dart';

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
