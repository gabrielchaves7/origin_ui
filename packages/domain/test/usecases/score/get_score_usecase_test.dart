// ignore_for_file: inference_failure_on_collection_literal, lines_longer_than_80_chars

import 'package:dartz/dartz.dart';
import 'package:domain/origin_ui_entities.dart';
import 'package:domain/src/domain/errors/failure.dart';
import 'package:domain/src/domain/repositories/score/score_repository.dart';
import 'package:domain/src/domain/usecases/score/get_score_usecase.dart';
import 'package:domain/src/enum/score_status_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_score_usecase_test.mocks.dart';

final Score mockedScore = Score(
  status: ScoreStatusEnum.healthy,
  annualIncome: 1000,
  monthlyCosts: 10,
);

@GenerateMocks([ScoreRepository])
void main() {
  group('GetScoreUseCase', () {
    test(
        'GetScoreUseCase should call scoreRepository.get() and return the right values',
        () async {
      final ScoreRepository mockedScoreRepository = MockScoreRepository();

      when(
        mockedScoreRepository.post(annualIncome: '1000', monthlyCosts: '10'),
      ).thenAnswer((_) async => Right(mockedScore));

      final getScoreUseCase = GetScoreUseCase(
        scoreRepository: mockedScoreRepository,
      );

      final result =
          await getScoreUseCase(annualIncome: '1000', monthlyCosts: '10');

      verify(
        mockedScoreRepository.post(
          annualIncome: '1000',
          monthlyCosts: '10',
        ),
      );
      expect(result.isRight(), true);
      result.fold(
        (exception) => {},
        (score) => {
          expect(score.annualIncome, 1000),
          expect(score.monthlyCosts, 10),
          expect(score.status, ScoreStatusEnum.healthy)
        },
      );
    });

    test(
        'When ScoreRepository returns a failure GetScoreUseCase should return the left value',
        () async {
      final ScoreRepository mockedScoreRepository = MockScoreRepository();

      when(
        mockedScoreRepository.post(annualIncome: '1000', monthlyCosts: '10'),
      ).thenAnswer((_) async => Left(UnexpectedFailure()));

      final getScoreUseCase =
          GetScoreUseCase(scoreRepository: mockedScoreRepository);

      final result =
          await getScoreUseCase(annualIncome: '1000', monthlyCosts: '10');

      verify(
        mockedScoreRepository.post(
          annualIncome: '1000',
          monthlyCosts: '10',
        ),
      );
      expect(result.isLeft(), true);
    });
  });
}
