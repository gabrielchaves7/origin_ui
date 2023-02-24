import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origin_design_system/assets.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';
import 'package:origin_ui/home/view/financial_wellness_input.dart';
import 'package:origin_ui/l10n/l10n.dart';

class FinancialWellnessCardFront extends StatelessWidget {
  const FinancialWellnessCardFront({required this.controller, super.key});

  final FlipCardController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: 544,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final homeCubit = context.read<HomeCubit>();
          return OriginCard(
            child: Column(
              children: [
                OriginIconAndText(
                  iconPath:
                      Assets.origin_design_system$assets_origin_icon_circle_svg,
                  texts: [
                    Text(
                      l10n.homeCardTitle,
                      textAlign: TextAlign.center,
                    ).headingSmall,
                    Text(
                      l10n.homeCardSubtitle,
                      textAlign: TextAlign.center,
                    ).paragraph
                  ],
                ),
                const SizedBox(height: OriginSpacing.xx),
                if (OriginBreakpoint.isDesktop(context))
                  _inputsDesktopLayout(context, l10n, homeCubit)
                else
                  _inputsMobileLayout(context, l10n, homeCubit),
                OriginOutlinedButton(
                  onPressed: homeCubit.formIsValid
                      ? () async {
                          await homeCubit.onContinue();
                          await controller.toggleCard();
                        }
                      : null,
                  child: Text(l10n.homeContinueButton),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _annualIncomeInput(AppLocalizations l10n, HomeCubit homeCubit) {
    return FinancialWellnessInput(
      label: l10n.homeAnnualIncomeInputLabel,
      onChanged: homeCubit.annualIncomeChanged,
      errorText: homeCubit.annualIncomeInput.errorText(l10n),
      homeCubit: homeCubit,
    );
  }

  Widget _monthlyCostsInput(AppLocalizations l10n, HomeCubit homeCubit) {
    return FinancialWellnessInput(
      label: l10n.homeMonthlyCostsInputLabel,
      onChanged: homeCubit.monthlyCostsChanged,
      errorText: homeCubit.monthlyCostsInput.errorText(l10n),
      homeCubit: homeCubit,
    );
  }

  Widget _inputsMobileLayout(
    BuildContext context,
    AppLocalizations l10n,
    HomeCubit homeCubit,
  ) {
    return Column(
      children: [
        _annualIncomeInput(l10n, homeCubit),
        const SizedBox(
          height: OriginSpacing.xx,
        ),
        _monthlyCostsInput(l10n, homeCubit),
        const SizedBox(height: OriginSpacing.xx),
      ],
    );
  }

  Widget _inputsDesktopLayout(
    BuildContext context,
    AppLocalizations l10n,
    HomeCubit homeCubit,
  ) {
    return Row(
      children: [
        Expanded(
          child: Container(
            constraints: const BoxConstraints(minHeight: 112),
            child: _annualIncomeInput(l10n, homeCubit),
          ),
        ),
        const SizedBox(width: OriginSpacing.xx),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(minHeight: 112),
            child: _monthlyCostsInput(l10n, homeCubit),
          ),
        ),
      ],
    );
  }
}
