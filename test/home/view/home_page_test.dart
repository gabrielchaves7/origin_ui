import 'package:flutter_test/flutter_test.dart';
import 'package:origin_design_system/origin_design_system.dart';

import 'package:origin_ui/home/home.dart';

import '../../helpers/helpers.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpApp(const HomePage());
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.byType(OriginPage), findsOneWidget);
      expect(find.byType(OriginTextField), findsNWidgets(2));
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
      expect(find.text('Annual income'), findsOneWidget);
      expect(find.text('Monthly Costs'), findsOneWidget);

      expect(find.text('Continue'), findsOneWidget);
      expect(
        find.text(
          "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'should render error text if annual income input has value equal to zero',
        (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.enterText(find.byType(OriginTextField).first, '0');
      await tester.pumpAndSettle();
      expect(
        find.text('Annual income must be greater than zero.'),
        findsOneWidget,
      );
    });

    testWidgets(
        'should render error text if annual income input has invalid value',
        (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.enterText(find.byType(OriginTextField).first, '0');
      await tester.enterText(find.byType(OriginTextField).first, '');
      await tester.pumpAndSettle();
      expect(
        find.text('Annual income value is invalid.'),
        findsOneWidget,
      );
    });

    testWidgets(
        'should render error text if monthly costs input has value equal to zero',
        (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.enterText(find.byType(OriginTextField).last, '0');
      await tester.pumpAndSettle();
      expect(
        find.text('Monthly Costs must be greater than zero.'),
        findsOneWidget,
      );
    });

    testWidgets(
        'should render error text if monthly costs input has invalid value',
        (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.enterText(find.byType(OriginTextField).last, '0');
      await tester.enterText(find.byType(OriginTextField).last, '');
      await tester.pumpAndSettle();
      expect(
        find.text('Monthly Costs value is invalid.'),
        findsOneWidget,
      );
    });
  });
}
