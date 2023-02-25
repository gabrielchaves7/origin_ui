import 'package:dartz/dartz.dart';
import 'package:domain/origin_ui_entities.dart';
import 'package:domain/origin_ui_enums.dart';
import 'package:domain/origin_ui_errors.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';
import 'package:origin_ui/home/forms/financial_wellness_form.dart';

Future<Either<Failure, Score>> score(
  ScoreStatusEnum status,
  int annualIncome,
  int monthlyCosts,
) {
  return Future(
    () => Right(
      Score(
        status: ScoreStatusEnum.healthy,
        annualIncome: annualIncome,
        monthlyCosts: monthlyCosts,
      ),
    ),
  );
}

HomeState mockState({
  Score? score,
  Failure? error,
}) {
  return HomeState(
    financialWellnessForm: FinancialWellnessForm(),
    score: score,
    error: error,
  );
}
