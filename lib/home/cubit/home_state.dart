part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({required this.financialWellnessForm});

  final FinancialWellnessForm financialWellnessForm;

  @override
  List<Object?> get props => [financialWellnessForm];

  HomeState copyWith({
    required AnnualIncomeInput annualIncomeInput,
    required MonthlyCostsInput monthlyCostsInput,
  }) {
    return HomeState(
      financialWellnessForm: FinancialWellnessForm(
        annualIncomeInput: annualIncomeInput,
        monthlyCostsInput: monthlyCostsInput,
      ),
    );
  }
}
