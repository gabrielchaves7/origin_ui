import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:origin_ui/home/forms/financial_wellness_form.dart';
import 'package:origin_ui/home/forms/inputs/annual_income_input.dart';
import 'package:origin_ui/home/forms/inputs/monthly_costs_input.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(financialWellnessForm: FinancialWellnessForm()));

  FinancialWellnessForm get financialWellnessForm =>
      state.financialWellnessForm;

  AnnualIncomeInput get annualIncomeInput =>
      state.financialWellnessForm.annualIncomeInput;

  MonthlyCostsInput get monthlyCostsInput =>
      state.financialWellnessForm.monthlyCostsInput;

  bool get formIsValid =>
      state.financialWellnessForm.status == FormzStatus.valid;

  void annualIncomeChanged(String value) => emit(
        state.copyWith(
          annualIncomeInput: AnnualIncomeInput.dirty(value: value),
          monthlyCostsInput: state.financialWellnessForm.monthlyCostsInput,
        ),
      );

  void monthlyCostsChanged(String value) => emit(
        state.copyWith(
          annualIncomeInput: state.financialWellnessForm.annualIncomeInput,
          monthlyCostsInput: MonthlyCostsInput.dirty(value: value),
        ),
      );
}
