import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origin_design_system/assets.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';
import 'package:origin_ui/home/view/financial_wellness_card.dart';
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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: RichText(
                        key: ValueKey<bool>(state.cardIsFront),
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: state.cardIsFront
                              ? l10n.homeFrontTitle
                              : l10n.homeBackTitle,
                          children: <TextSpan>[
                            TextSpan(
                              text: state.cardIsFront
                                  ? l10n.homeFrontTitleBold
                                  : l10n.homeBackTitleBold,
                              style: OriginTextStyles.subtitleSemibold,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
