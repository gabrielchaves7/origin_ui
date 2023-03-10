import 'package:domain/origin_ui_entities.dart';
import 'package:domain/origin_ui_enums.dart';
import 'package:domain/origin_ui_errors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:origin_design_system/origin_design_system.dart';

import 'package:origin_ui/home/home.dart';
import 'package:origin_ui/home/view/financial_wellness_card_back.dart';

import '../../helpers/helpers.dart';
import '../../helpers/mock_states.dart';
import '../../mocks/mocks.dart';

void main() {
  group('FinancialWellnessCardBack', () {
    final flipCardController = FlipCardController();

    late HomeCubit homeCubit;

    setUp(() {
      homeCubit = MockHomeCubit();
    });

    Future<void> pumpApp(WidgetTester tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: homeCubit,
          child: FinancialWellnessCardBack(
            controller: flipCardController,
          ),
        ),
      );
    }

    testWidgets('renders FinancialWellnessCardBack', (tester) async {
      when(() => homeCubit.state).thenReturn(
        mockState(
          score: Score(
            annualIncome: 1000,
            monthlyCosts: 10,
            status: ScoreStatusEnum.healthy,
          ),
        ),
      );
      await pumpApp(tester);

      expect(find.byType(OriginCard), findsOneWidget);
      expect(find.byType(OriginIcon), findsOneWidget);
      expect(find.byType(OriginOutlinedButton), findsOneWidget);
      expect(find.byType(OriginGraph), findsOneWidget);
      expect(find.text('Return'), findsOneWidget);
    });

    testWidgets('should render healthly title and subtitle', (tester) async {
      when(() => homeCubit.state).thenReturn(
        mockState(
          score: Score(
            annualIncome: 1000,
            monthlyCosts: 10,
            status: ScoreStatusEnum.healthy,
          ),
        ),
      );
      await pumpApp(tester);

      expect(find.text('Congratulations!'), findsOneWidget);
      expect(
        find.text(
          'Your financial wellness score is Healthy.',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('should render medium title and subtitle', (tester) async {
      when(() => homeCubit.state).thenReturn(
        mockState(
          score: Score(
            annualIncome: 1000,
            monthlyCosts: 10,
            status: ScoreStatusEnum.medium,
          ),
        ),
      );
      await pumpApp(tester);

      expect(find.text('There is room for improvement.'), findsOneWidget);
      expect(
        find.text(
          'Your financial wellness score is Average.',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('should render low title and subtitle', (tester) async {
      when(() => homeCubit.state).thenReturn(
        mockState(
          score: Score(
            annualIncome: 1000,
            monthlyCosts: 10,
            status: ScoreStatusEnum.low,
          ),
        ),
      );
      await pumpApp(tester);

      expect(find.text('Caution!'), findsOneWidget);
      expect(
        find.text(
          'Your financial wellness score is Unhealthy.',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('should render error text when error is not null',
        (tester) async {
      final state = mockState(error: UnexpectedFailure());
      when(() => homeCubit.state).thenReturn(state);
      await pumpApp(tester);

      expect(
        find.text(
          'Something went wrong while trying to get your financial score.',
        ),
        findsOneWidget,
      );
    });
  });
}
