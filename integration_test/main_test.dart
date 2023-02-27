import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/app/view/app.dart';
import 'package:origin_ui/home/view/financial_wellness_card_front.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Make financial wellness test', (tester) async {
    await tester.pumpWidget(const App());
    await tester.enterText(find.byType(OriginTextField).first, '1000');
    await tester.enterText(find.byType(OriginTextField).last, '10');
    await tester.pumpAndSettle();
    await tester.tap(find.byType(OriginOutlinedButton).first);
    await tester.pumpAndSettle();

    expect(find.text('Congratulations!').hitTestable(), findsOneWidget);
    expect(
      find
          .text('Your financial wellness score is Healthy.', findRichText: true)
          .hitTestable(),
      findsOneWidget,
    );

    expect(find.byType(FinancialWellnessCardFront), findsOneWidget);
  });
}
