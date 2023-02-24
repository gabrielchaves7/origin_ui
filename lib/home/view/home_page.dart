import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origin_design_system/assets.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';
import 'package:origin_ui/home/view/financial_wellness_card.dart';
import 'package:origin_ui/home/view/financial_wellness_input.dart';
import 'package:origin_ui/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late FlipCardController _controller;

  @override
  void initState() {
    _controller = FlipCardController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return OriginPage(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: OriginSpacing.xx),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: l10n.homeTitle,
                    style: OriginTextStyles.subtitle,
                    children: <TextSpan>[
                      TextSpan(
                        text: l10n.homeTitleBold,
                        style: OriginTextStyles.subtitleSemibold,
                      ),
                    ],
                  ),
                ),
              ),
              const FinancialWellnessCard(),
              const SizedBox(height: OriginSpacing.xxxxs),
              Container(
                constraints: const BoxConstraints(maxWidth: 650),
                child: OriginIconAndText(
                  iconPath: Assets.origin_design_system$assets_lock_svg,
                  iconSize: OriginIconSize.xSmall,
                  texts: [
                    Text(
                      l10n.homeFooter,
                      style: const TextStyle(color: OriginColors.blueGray400),
                      textAlign: TextAlign.center,
                    ).description
                  ],
                ),
              ),
              const SizedBox(
                height: OriginSpacing.xxxxs,
              )
            ],
          ),
        ),
      ),
    );
  }
}
