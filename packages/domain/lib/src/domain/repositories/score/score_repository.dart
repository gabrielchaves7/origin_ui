import 'package:dartz/dartz.dart';
import 'package:domain/src/domain/entities/score/score_entity.dart';
import 'package:domain/src/domain/errors/failure.dart';

// ignore: one_member_abstracts
abstract class ScoreRepository {
  Future<Either<Failure, Score>> get({
    required String annualIncome,
    required String monthlyCosts,
  });
}
