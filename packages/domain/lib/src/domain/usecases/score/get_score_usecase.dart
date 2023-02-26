import 'package:dartz/dartz.dart';
import 'package:domain/src/domain/entities/score/score_entity.dart';
import 'package:domain/src/domain/errors/failure.dart';
import 'package:domain/src/domain/repositories/score/score_repository.dart';

class GetScoreUseCase {
  GetScoreUseCase({
    required this.scoreRepository,
  });

  final ScoreRepository scoreRepository;

  Future<Either<Failure, Score>> call({
    required String annualIncome,
    required String monthlyCosts,
  }) async {
    return scoreRepository.post(
      annualIncome: annualIncome,
      monthlyCosts: monthlyCosts,
    );
  }
}
