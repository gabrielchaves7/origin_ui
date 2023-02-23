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
  List<Object?> get props => [financialWellnessForm];

  HomeState copyWith({
    required AnnualIncomeInput annualIncomeInput,
    required MonthlyCostsInput monthlyCostsInput,
    String? annualIncomeErrorText,
    String? monthlyCostsErrorText,
  }) {
    return HomeState(
      financialWellnessForm: FinancialWellnessForm(
        annualIncomeInput: annualIncomeInput,
        monthlyCostsInput: monthlyCostsInput,
      ),
      annualIncomeErrorText: annualIncomeErrorText,
      monthlyCostsErrorText: monthlyCostsErrorText,
    );
  }
}
