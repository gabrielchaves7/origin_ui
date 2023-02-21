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
      body: SingleChildScrollView(
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
            OriginCard(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final homeCubit = context.read<HomeCubit>();
                  return Column(
                    children: [
                      const OriginIcon(
                        iconPath: Assets
                            .origin_design_system$assets_origin_icon_circle_svg,
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
                        leadingIconPath:
                            Assets.origin_design_system$assets_dollar_sign_svg,
                        onChanged: homeCubit.annualIncomeChanged,
                        errorText: homeCubit.annualIncomeInput.errorText(l10n),
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
                        leadingIconPath:
                            Assets.origin_design_system$assets_dollar_sign_svg,
                        onChanged: homeCubit.monthlyCostsChanged,
                        errorText: homeCubit.monthlyCostsInput.errorText(l10n),
                      ),
                      const SizedBox(height: OriginSpacing.xx),
                      OriginOutlinedButton(
                        onPressed: homeCubit.formIsValid ? () {} : null,
                        child: Text(l10n.homeContinueButton),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: OriginSpacing.xxxxs),
            const OriginIcon(
              iconPath: Assets.origin_design_system$assets_lock_svg,
              size: OriginIconSize.xSmall,
            ),
            const SizedBox(
              height: OriginSpacing.xx,
            ),
            Text(
              l10n.homeFooter,
              style: const TextStyle(color: OriginColors.blueGray400),
              textAlign: TextAlign.center,
            ).description
          ],
        ),
      ),
    );
  }
}
