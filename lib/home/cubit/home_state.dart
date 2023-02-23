part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.financialWellnessForm,
    this.annualIncomeErrorText,
    this.monthlyCostsErrorText,
  });

  final FinancialWellnessForm financialWellnessForm;

  final String? annualIncomeErrorText;

  final String? monthlyCostsErrorText;

  @override
  List<Object?> get props => [
        financialWellnessForm,
        annualIncomeErrorText,
        monthlyCostsErrorText,
      ];

  HomeState copyWith({
    AnnualIncomeInput? annualIncomeInput,
    MonthlyCostsInput? monthlyCostsInput,
    String? annualIncomeErrorText,
    String? monthlyCostsErrorText,
    bool? isLoading,
  }) {
    return HomeState(
      financialWellnessForm: FinancialWellnessForm(
        annualIncomeInput:
            annualIncomeInput ?? financialWellnessForm.annualIncomeInput,
        monthlyCostsInput:
            monthlyCostsInput ?? financialWellnessForm.monthlyCostsInput,
      ),
      annualIncomeErrorText:
          annualIncomeErrorText ?? this.annualIncomeErrorText,
      monthlyCostsErrorText:
          monthlyCostsErrorText ?? this.monthlyCostsErrorText,
    );
  }
}
