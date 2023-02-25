// ignore_for_file: lines_longer_than_80_chars

import 'package:domain/origin_ui_enums.dart';
import 'package:domain/origin_ui_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/app/view/app.dart';

import 'package:origin_ui/home/home.dart';
import 'package:origin_ui/home/view/financial_wellness_card.dart';
import 'package:origin_ui/home/view/financial_wellness_card_front.dart';

import '../../helpers/helpers.dart';
import '../../helpers/mock_states.dart';
import '../../mocks/mocks.dart';

void main() {
  final mockedGetScoreUseCase = MockGetScoreUseCase();

  setUpAll(() {
    getIt.registerFactory<GetScoreUseCase>(
      () => mockedGetScoreUseCase,
    );
  });

  tearDownAll(() {
    getIt.unregister<GetScoreUseCase>();
  });

  group('FinancialWellnessCard', () {
    Future<void> pumpApp({
      required WidgetTester tester,
    }) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: HomeCubit(),
          child: const FinancialWellnessCard(),
        ),
      );
    }

    testWidgets('renders FinancialWellnessCard', (tester) async {
      await pumpApp(tester: tester);
      expect(find.byType(FinancialWellnessCardFront), findsOneWidget);
    });

    testWidgets(
        'when financial information is valid and continue button is clicked, should flip the card',
        (tester) async {
      when(
        () => mockedGetScoreUseCase.call(
          annualIncome: '1000',
          monthlyCosts: '10',
        ),
      ).thenAnswer(
        (_) => score(ScoreStatusEnum.healthy, 1000, 10),
      );
      await pumpApp(tester: tester);

      expect(find.text('Congratulations!').hitTestable(), findsNothing);
      expect(
        find.text('Your financial wellness score is Healthy.').hitTestable(),
        findsNothing,
      );

      await tester.enterText(find.byType(OriginTextField).first, '1000');
      await tester.enterText(find.byType(OriginTextField).last, '10');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(OriginOutlinedButton));
      await tester.pumpAndSettle();

      expect(find.text('Congratulations!').hitTestable(), findsOneWidget);
      expect(
        find.text('Your financial wellness score is Healthy.').hitTestable(),
        findsOneWidget,
      );

      expect(find.byType(FinancialWellnessCardFront), findsOneWidget);
    });
  });
}
