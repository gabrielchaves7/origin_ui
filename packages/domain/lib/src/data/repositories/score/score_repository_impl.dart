import 'package:dartz/dartz.dart';
import 'package:domain/src/data/datasource/score/score_datasource_impl.dart';
import 'package:domain/src/domain/entities/score/score_entity.dart';
import 'package:domain/src/domain/errors/failure.dart';
import 'package:domain/src/domain/repositories/score/score_repository.dart';

class ScoreRepositoryImpl implements ScoreRepository {
  ScoreRepositoryImpl({
    required this.scoreDataSource,
  });

  final ScoreDataSource scoreDataSource;

  @override
  Future<Either<Failure, Score>> get({
    required String annualIncome,
    required String monthlyCosts,
  }) async {
    try {
      final score = await scoreDataSource.get(
        annualIncome: annualIncome,
        monthlyCosts: monthlyCosts,
      );

      return Right(score);
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
