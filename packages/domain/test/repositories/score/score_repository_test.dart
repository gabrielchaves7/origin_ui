// ignore_for_file: inference_failure_on_collection_literal, lines_longer_than_80_chars

import 'package:domain/src/data/datasource/score/score_datasource_impl.dart';
import 'package:domain/src/data/models/score/score_model.dart';
import 'package:domain/src/data/repositories/score/score_repository_impl.dart';
import 'package:domain/src/domain/errors/failure.dart';
import 'package:domain/src/domain/repositories/score/score_repository.dart';
import 'package:domain/src/enum/score_status_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'score_repository_test.mocks.dart';

final ScoreModel mockedScore = ScoreModel(
  status: ScoreStatusEnum.medium,
  annualIncome: 2000,
  monthlyCosts: 40,
);

@GenerateMocks([ScoreDataSource])
void main() {
  group('ScoreRepository', () {
    test(
        'When ScoreDataSource returns ScoreModel ScoreRepository should return a ScoreEntity',
        () async {
      final ScoreDataSource mockedScoreDataSource = MockScoreDataSource();

      when(
        mockedScoreDataSource.get(annualIncome: '2000', monthlyCosts: '40'),
      ).thenAnswer((_) async => mockedScore);

      final ScoreRepository scoreRepository =
          ScoreRepositoryImpl(scoreDataSource: mockedScoreDataSource);

      final result = await scoreRepository.get(
        annualIncome: '2000',
        monthlyCosts: '40',
      );

      verify(
        mockedScoreDataSource.get(
          annualIncome: '2000',
          monthlyCosts: '40',
        ),
      );
      expect(result.isRight(), true);
      result.fold(
        (exception) => {},
        (score) => {
          expect(score.annualIncome, 2000),
          expect(score.monthlyCosts, 40),
          expect(score.status, ScoreStatusEnum.medium)
        },
      );
    });

    test(
        'When ScoreDataSource throws an exception ScoreRepository should return the left value with UnexpectedFailure',
        () async {
      final ScoreDataSource mockedScoreDataSource = MockScoreDataSource();

      when(
        mockedScoreDataSource.get(annualIncome: '2000', monthlyCosts: '40'),
      ).thenThrow((_) async => Exception());

      final ScoreRepository scoreRepository =
          ScoreRepositoryImpl(scoreDataSource: mockedScoreDataSource);

      final result = await scoreRepository.get(
        annualIncome: '2000',
        monthlyCosts: '40',
      );

      verify(
        mockedScoreDataSource.get(
          annualIncome: '2000',
          monthlyCosts: '40',
        ),
      );
      expect(result.isLeft(), true);
      result.fold(
        (exception) => {expect(exception is UnexpectedFailure, true)},
        (score) => {},
      );
    });
  });
}
