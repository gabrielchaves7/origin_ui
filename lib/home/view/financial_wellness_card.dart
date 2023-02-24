import 'package:flutter/material.dart';
import 'package:origin_design_system/origin_design_system.dart';
import 'package:origin_ui/home/view/financial_wellness_card_back.dart';
import 'package:origin_ui/home/view/financial_wellness_card_front.dart';

class FinancialWellnessCard extends StatefulWidget {
  const FinancialWellnessCard({super.key});

  @override
  State<FinancialWellnessCard> createState() => _FinancialWellnessCardState();
}

class _FinancialWellnessCardState extends State<FinancialWellnessCard> {
  late FlipCardController _controller;

  @override
  void initState() {
    _controller = FlipCardController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 544,
      child: OriginFlipCard(
        front: FinancialWellnessCardFront(
          controller: _controller,
        ),
        back: FinancialWellnessCardBack(controller: _controller),
        controller: _controller,
      ),
    );
  }
}
