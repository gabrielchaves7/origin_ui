// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_invocation
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/origin_ui_enums.dart';
import 'package:domain/origin_ui_errors.dart';
import 'package:domain/origin_ui_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:origin_ui/app/app.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';

import '../../helpers/mock_states.dart';
import '../../mocks/mocks.dart';

void main() {
  final mockedGetScoreUseCase = MockGetScoreUseCase();

  setUp(() {
    getIt.registerFactory<GetScoreUseCase>(
      () => mockedGetScoreUseCase,
    );
  });

  tearDown(() {
    getIt.reset();
    reset(mockedGetScoreUseCase);
  });

  group('Home Cubit', () {
    blocTest(
      'should update annual income form status when annualIncomeChanged is called',
      build: () {
        return HomeCubit();
      },
      act: (HomeCubit homeCubit) async {
        homeCubit.annualIncomeChanged('1000');
      },
      expect: () => [isA<HomeState>()],
      verify: (homeCubit) {
        expect(homeCubit.annualIncomeInput.status, FormzInputStatus.valid);
      },
    );

    blocTest(
      'should update monthly costs form status when monthlyCostsChanged is called ',
      build: () {
        return HomeCubit();
      },
      act: (HomeCubit homeCubit) async {
        homeCubit.monthlyCostsChanged('100');
      },
      expect: () => [isA<HomeState>()],
      verify: (homeCubit) {
        expect(homeCubit.annualIncomeInput.status, FormzInputStatus.pure);
      },
    );

    blocTest(
      'financial wellness form should have valid status when both inputs are valid',
      build: () {
        return HomeCubit();
      },
      act: (HomeCubit homeCubit) async {
        homeCubit
          ..annualIncomeChanged('1000')
          ..monthlyCostsChanged('100');
      },
      expect: () => [isA<HomeState>(), isA<HomeState>()],
      verify: (homeCubit) {
        expect(homeCubit.annualIncomeInput.status, FormzInputStatus.valid);
        expect(homeCubit.monthlyCostsInput.status, FormzInputStatus.valid);
        expect(homeCubit.financialWellnessForm.status, FormzStatus.valid);
      },
    );

    blocTest(
      'financial wellness form should have invalid status if annual income status is pure',
      build: () {
        return HomeCubit();
      },
      act: (HomeCubit homeCubit) async {
        homeCubit.monthlyCostsChanged('100');
      },
      expect: () => [
        isA<HomeState>(),
      ],
      verify: (homeCubit) {
        expect(homeCubit.annualIncomeInput.status, FormzInputStatus.pure);
        expect(homeCubit.monthlyCostsInput.status, FormzInputStatus.valid);
        expect(homeCubit.financialWellnessForm.status, FormzStatus.invalid);
      },
    );

    blocTest(
      'financial wellness form should have invalid status if monthly costs status is pure',
      build: () {
        return HomeCubit();
      },
      act: (HomeCubit homeCubit) async {
        homeCubit.annualIncomeChanged('1000');
      },
      expect: () => [
        isA<HomeState>(),
      ],
      verify: (homeCubit) {
        expect(homeCubit.annualIncomeInput.status, FormzInputStatus.valid);
        expect(homeCubit.monthlyCostsInput.status, FormzInputStatus.pure);
        expect(homeCubit.financialWellnessForm.status, FormzStatus.invalid);
      },
    );

    blocTest(
      'onContinue should NOT call getScoreUseCase if form status is invalid',
      setUp: () {},
      build: () {
        return HomeCubit();
      },
      act: (HomeCubit homeCubit) async {
        homeCubit
          ..annualIncomeChanged('1000')
          ..monthlyCostsChanged('0');
        await homeCubit.onContinue();
      },
      expect: () => [
        isA<HomeState>(),
        isA<HomeState>(),
      ],
      verify: (homeCubit) {
        expect(homeCubit.financialWellnessForm.status, FormzStatus.invalid);
        verifyNever(
          () => mockedGetScoreUseCase.call(
            annualIncome: '1000',
            monthlyCosts: '0',
          ),
        );
      },
    );

    blocTest(
      'onContinue should call getScoreUseCase and emit score state if form status is valid',
      setUp: () {
        when(
          () => mockedGetScoreUseCase.call(
            annualIncome: '1000',
            monthlyCosts: '10',
          ),
        ).thenAnswer((_) => score(ScoreStatusEnum.healthy, 1000, 10));
      },
      build: () {
        return HomeCubit();
      },
      act: (HomeCubit homeCubit) async {
        homeCubit
          ..annualIncomeChanged('1000')
          ..monthlyCostsChanged('10');
        await homeCubit.onContinue();
      },
      expect: () => [
        isA<HomeState>(),
        isA<HomeState>(),
        isA<HomeState>(),
      ],
      verify: (homeCubit) {
        expect(homeCubit.financialWellnessForm.status, FormzStatus.valid);
        verify(
          () => mockedGetScoreUseCase.call(
            annualIncome: '1000',
            monthlyCosts: '10',
          ),
        ).called(1);
        expect(homeCubit.state.score?.annualIncome, 1000);
        expect(homeCubit.state.score?.monthlyCosts, 10);
        expect(homeCubit.state.score?.status, ScoreStatusEnum.healthy);
      },
    );

    blocTest(
      'should emit error state when getScoreUseCase returns a failure',
      setUp: () {
        when(
          () => mockedGetScoreUseCase.call(
            annualIncome: '1000',
            monthlyCosts: '10',
          ),
        ).thenAnswer((_) => Future(() => Left(UnexpectedFailure())));
      },
      build: () {
        return HomeCubit();
      },
      act: (HomeCubit homeCubit) async {
        homeCubit
          ..annualIncomeChanged('1000')
          ..monthlyCostsChanged('10');
        await homeCubit.onContinue();
      },
      expect: () => [
        isA<HomeState>(),
        isA<HomeState>(),
        isA<HomeState>(),
      ],
      verify: (homeCubit) {
        expect(homeCubit.state.error, const TypeMatcher<UnexpectedFailure>());
      },
    );
  });
}
