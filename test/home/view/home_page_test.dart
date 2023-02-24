import 'package:flutter_test/flutter_test.dart';
import 'package:origin_design_system/origin_design_system.dart';

import 'package:origin_ui/home/home.dart';
import 'package:origin_ui/home/view/financial_wellness_card.dart';

import '../../helpers/helpers.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpApp(const HomePage());
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
  });
}
