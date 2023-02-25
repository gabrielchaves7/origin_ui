// ignore_for_file: lines_longer_than_80_chars
import 'package:domain/origin_ui_enums.dart';
import 'package:domain/origin_ui_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/app/view/app.dart';

import 'package:origin_ui/home/home.dart';
import 'package:origin_ui/home/view/financial_wellness_card_front.dart';

import '../../helpers/helpers.dart';
import '../../helpers/mock_states.dart';
import '../../mocks/mocks.dart';

void main() {
  final mockedGetScoreUseCase = MockGetScoreUseCase();

  setUp(() {
    getIt.registerFactory<GetScoreUseCase>(
      () => mockedGetScoreUseCase,
    );
  });

  tearDown(getIt.reset);

  group('FinancialWellnessCardFront', () {
    final flipCardController = FlipCardController();

    Future<void> pumpApp({
      required WidgetTester tester,
      HomeCubit? homeCubit,
    }) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: homeCubit ?? HomeCubit(),
          child: FinancialWellnessCardFront(
            controller: flipCardController,
          ),
        ),
      );
    }

    testWidgets('renders FinancialWellnessCardFront', (tester) async {
      await pumpApp(tester: tester);

      expect(find.byType(OriginCard), findsOneWidget);
      expect(find.byType(OriginIconAndText), findsOneWidget);
      expect(find.byType(OriginOutlinedButton), findsOneWidget);
      expect(find.text('Financial wellness test'), findsOneWidget);
      expect(
        find.text('Enter your financial information bellow'),
        findsOneWidget,
      );
      expect(find.text('Annual income'), findsOneWidget);
      expect(find.text('Monthly Costs'), findsOneWidget);

      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets(
        'should render error text if annual income input has value equal to zero',
        (tester) async {
      await pumpApp(tester: tester);
      await tester.enterText(find.byType(OriginTextField).first, '0');
      await tester.tap(find.byType(OriginOutlinedButton));
      await tester.pumpAndSettle();
      expect(
        find.text('Annual income must be greater than zero.'),
        findsOneWidget,
      );
    });

    testWidgets(
        'should render error text if annual income input has invalid value',
        (tester) async {
      await pumpApp(tester: tester);
      await tester.enterText(find.byType(OriginTextField).first, '0');
      await tester.enterText(find.byType(OriginTextField).first, '');
      await tester.tap(find.byType(OriginOutlinedButton));
      await tester.pumpAndSettle();
      expect(
        find.text('Annual income value is invalid.'),
        findsOneWidget,
      );
    });

    testWidgets(
        'should render error text if monthly costs input has value equal to zero',
        (tester) async {
      await pumpApp(tester: tester);
      await tester.enterText(find.byType(OriginTextField).last, '0');
      await tester.tap(find.byType(OriginOutlinedButton));
      await tester.pumpAndSettle();
      expect(
        find.text('Monthly Costs must be greater than zero.'),
        findsOneWidget,
      );
    });

    testWidgets(
        'should render error text if monthly costs input has invalid value',
        (tester) async {
      await pumpApp(tester: tester);
      await tester.enterText(find.byType(OriginTextField).last, '0');
      await tester.enterText(find.byType(OriginTextField).last, '');
      await tester.tap(find.byType(OriginOutlinedButton));
      await tester.pumpAndSettle();
      expect(
        find.text('Monthly Costs value is invalid.'),
        findsOneWidget,
      );
    });

    testWidgets(
        'should NOT call onContinue if form status is invalid and continue button is clicked',
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
      await tester.tap(find.byType(OriginOutlinedButton));

      verifyNever(
        () => mockedGetScoreUseCase.call(
          annualIncome: '1000',
          monthlyCosts: '10',
        ),
      );
    });

    testWidgets(
        'should call onContinue if form status is valid and continue button is clicked',
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
      await tester.enterText(find.byType(OriginTextField).first, '1000');
      await tester.enterText(find.byType(OriginTextField).last, '10');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(OriginOutlinedButton));
      await tester.pumpAndSettle();

      verify(
        () => mockedGetScoreUseCase.call(
          annualIncome: '1000',
          monthlyCosts: '10',
        ),
      ).called(1);
    });
  });
}
