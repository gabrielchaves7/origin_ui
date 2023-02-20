import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

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
    });
  });
}
