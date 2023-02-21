// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_invocation

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';

void main() {
  setUp(() {});
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
  });
}
