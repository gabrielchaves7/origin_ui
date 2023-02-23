import 'package:domain/origin_ui_domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/home/view/home_page.dart';
import 'package:origin_ui/l10n/l10n.dart';

final getIt = GetIt.instance;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    OriginUiDomain.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: OriginColors.brandColorPrimary,
        fontFamily: 'WorkSans',
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
