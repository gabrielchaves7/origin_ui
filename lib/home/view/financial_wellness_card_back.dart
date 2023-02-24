import 'package:domain/origin_ui_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origin_design_system/assets.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';
import 'package:origin_ui/l10n/l10n.dart';

class FinancialWellnessCardBack extends StatelessWidget {
  const FinancialWellnessCardBack({required this.controller, super.key});

  final FlipCardController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: 544,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final homeCubit = context.read<HomeCubit>();
          Widget widget = OriginCard(child: Container());
          if (homeCubit.state.score != null) {
            widget = OriginCard(
              child: Column(
                children: [
                  const OriginIcon(
                    iconPath: Assets
                        .origin_design_system$assets_origin_icon_circle_svg,
                  ),
                  const SizedBox(
                    height: OriginSpacing.xxx,
                  ),
                  ..._statusText(l10n, homeCubit.state.score!.status),
                  const SizedBox(
                    height: OriginSpacing.xxxx,
                  ),
                  OriginOutlinedButton(
                    onPressed: () async {
                      await controller.toggleCard();
                      homeCubit.onCardFlipDone(cardIsFront: true);
                    },
                    buttonType: OriginOutlinedButtonType.secondary,
                    child: Text(l10n.homeBackButton),
                  )
                ],
              ),
            );
          }

          return widget;
        },
      ),
    );
  }

  List<Widget> _statusText(AppLocalizations l10n, ScoreStatusEnum scoreStatus) {
    var title = l10n.homeScoreHealthlyTitle;
    var subtitle = l10n.homeScoreHealthlySubtitle;
    var color = OriginColors.green500;
    var selectedAmount = 3;

    if (scoreStatus == ScoreStatusEnum.medium) {
      title = l10n.homeScoreMediumTitle;
      subtitle = l10n.homeScoreMediumSubtitle;
      color = OriginColors.sun700;
      selectedAmount = 2;
    } else if (scoreStatus == ScoreStatusEnum.low) {
      title = l10n.homeScoreLowTitle;
      subtitle = l10n.homeScoreLowSubtitle;
      color = OriginColors.red700;
      selectedAmount = 1;
    }

    return [
      OriginGraph(
        amount: 3,
        selectedAmount: selectedAmount,
        selectedColor: color,
      ),
      const SizedBox(
        height: OriginSpacing.xxx,
      ),
      Text(title).headingSmall,
      Text(subtitle).paragraph,
    ];
  }
}
