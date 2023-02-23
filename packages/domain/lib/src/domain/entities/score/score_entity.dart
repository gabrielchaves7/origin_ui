import 'package:domain/src/enum/score_status_enum.dart';

class Score {
  Score({
    required this.status,
    required this.annualIncome,
    required this.monthlyCosts,
  });

  ScoreStatusEnum status;
  int annualIncome;
  int monthlyCosts;
}
