import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origin_design_system/assets.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';
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
      body: Column(
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
          OriginCard(
            child: Column(
              children: [
                const OriginIcon(
                  iconPath: Assets.origin_design_system$assets_origin_icon_circle_svg,
                ),
                const SizedBox(height: OriginSpacing.xx),
                Text(
                  l10n.homeCardTitle,
                  textAlign: TextAlign.center,
                ).headingSmall,
                Text(
                  l10n.homeCardSubtitle,
                  textAlign: TextAlign.center,
                ).paragraph,
                const SizedBox(height: OriginSpacing.xx),
                OriginTextField(
                  label: l10n.homeAnnualIncomeInputLabel,
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    NumericTextFormatter(),
                    LengthLimitingTextInputFormatter(11),
                  ],
                  icon: const OriginIcon(
                    iconPath: Assets.origin_design_system$assets_dollar_sign_svg,
                    size: OriginIconSize.extraSmall,
                  ),
                ),
                const SizedBox(height: OriginSpacing.xx),
                OriginTextField(
                  label: l10n.homeMonthlyCostsInputLabel,
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    NumericTextFormatter(),
                    LengthLimitingTextInputFormatter(11),
                  ],
                  icon: const OriginIcon(
                    iconPath: Assets.origin_design_system$assets_dollar_sign_svg,
                    size: OriginIconSize.extraSmall,
                  ),
                ),
                const SizedBox(height: OriginSpacing.xx),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(l10n.homeContinueButton),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
