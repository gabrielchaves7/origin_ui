import 'package:flutter/material.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/home/view/home_page.dart';
import 'package:origin_ui/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: OriginColors.brandColorPrimary,
        fontFamily: 'WorkSans',
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))),
            backgroundColor: MaterialStateProperty.all<Color>(
              OriginColors.brandColorPrimary,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              OriginTextStyles.button,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              OriginColors.neutralWhite,
            ),
          ),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
