import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:origin_design_system/assets.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';

class FinancialWellnessInput extends StatelessWidget {
  const FinancialWellnessInput({
    required this.homeCubit,
    required this.label,
    this.onChanged,
    this.errorText,
    super.key,
  });

  final HomeCubit homeCubit;
  final String label;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return OriginTextField(
      label: label,
      textInputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        NumericTextFormatter(),
        LengthLimitingTextInputFormatter(11),
      ],
      leadingIconPath: Assets.origin_design_system$assets_dollar_sign_svg,
      onChanged: onChanged,
      errorText: errorText,
    );
  }
}
