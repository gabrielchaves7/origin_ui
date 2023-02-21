import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:origin_design_system/origin_design_system.dart';

import 'package:origin_ui/home/home.dart';

import '../../helpers/helpers.dart';

class MockHomeCubit extends MockCubit<int> implements HomeCubit {}

void main() {
  // setUpAll(() {
  //   TestWidgetsFlutterBinding.ensureInitialized();
  // });
  group('HomePage', () {
    testWidgets('renders HomeView', (tester) async {
      await tester.pumpApp(const HomePage());
      expect(find.byType(HomeView), findsOneWidget);

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
      expect(find.byType(OriginTextField), findsNWidgets(2));
      expect(find.text('Continue'), findsOneWidget);
    });
  });
}
