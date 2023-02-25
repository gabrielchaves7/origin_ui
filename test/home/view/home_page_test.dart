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

  tearDown(() {
    getIt.unregister<GetScoreUseCase>();
  });

  Future<void> pumpApp({
    required WidgetTester tester,
  }) async {
    await tester.pumpApp(
      BlocProvider.value(
        value: HomeCubit(),
        child: const HomePage(),
      ),
    );
  }

  group('HomePage', () {
    testWidgets('renders HomePage', (tester) async {
      await pumpApp(tester: tester);
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.byType(FinancialWellnessCard), findsOneWidget);
      expect(find.byType(OriginIcon), findsNWidgets(4));
      expect(find.byType(OriginOutlinedButton), findsOneWidget);

      expect(
        find.text(
          "Let's find out your financial wellness score.",
          findRichText: true,
        ),
        findsOneWidget,
      );
      expect(find.text('Financial wellness test'), findsOneWidget);
      expect(
        find.text('Enter your financial information bellow'),
        findsOneWidget,
      );
      expect(
        find.text(
          "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
        ),
        findsOneWidget,
      );
    });

    testWidgets('when flip the card should update the title', (tester) async {
      when(
        () => mockedGetScoreUseCase.call(
          annualIncome: '1000',
          monthlyCosts: '10',
        ),
      ).thenAnswer(
        (_) => score(ScoreStatusEnum.healthy, 1000, 10),
      );
      await pumpApp(tester: tester);

      expect(
        find
            .text(
              "Let's find out your financial wellness score.",
              findRichText: true,
            )
            .hitTestable(),
        findsOneWidget,
      );

      await tester.enterText(find.byType(OriginTextField).first, '1000');
      await tester.enterText(find.byType(OriginTextField).last, '10');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(OriginOutlinedButton));
      await tester.pumpAndSettle();

      expect(
        find
            .text(
              "Here's your financial wellness score:",
              findRichText: true,
            )
            .hitTestable(),
        findsOneWidget,
      );
    });
  });
}
