import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:origin_ui/home/forms/financial_wellness_form.dart';
import 'package:origin_ui/home/forms/inputs/annual_income_input.dart';
import 'package:origin_ui/home/forms/inputs/monthly_costs_input.dart';
import 'package:origin_ui/l10n/l10n.dart';

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

  String? get annualIncomeErrorText => state.annualIncomeErrorText;

  String? get monthlyCostsErrorText => state.monthlyCostsErrorText;

  bool get formIsValid =>
      state.financialWellnessForm.status == FormzStatus.valid;

  void annualIncomeChanged(String value) => emit(
        state.copyWith(
          annualIncomeInput: AnnualIncomeInput.dirty(value: value),
          monthlyCostsInput: monthlyCostsInput,
          annualIncomeErrorText: annualIncomeErrorText,
          monthlyCostsErrorText: monthlyCostsErrorText,
        ),
      );

  void monthlyCostsChanged(String value) => emit(
        state.copyWith(
          annualIncomeInput: annualIncomeInput,
          monthlyCostsInput: MonthlyCostsInput.dirty(value: value),
          annualIncomeErrorText: annualIncomeErrorText,
          monthlyCostsErrorText: monthlyCostsErrorText,
        ),
      );

  void onContinue(AppLocalizations l10n) {
    emit(
      state.copyWith(
        annualIncomeInput: annualIncomeInput,
        monthlyCostsInput: monthlyCostsInput,
        annualIncomeErrorText: annualIncomeInput.errorText(l10n),
        monthlyCostsErrorText: monthlyCostsInput.errorText(l10n),
      ),
    );
  }
}
