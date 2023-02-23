import 'package:domain/src/domain/entities/score/score_entity.dart';
import 'package:domain/src/enum/score_status_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'score_model.g.dart';

@JsonSerializable()
class ScoreModel implements Score {
  ScoreModel({
    required this.status,
    required this.annualIncome,
    required this.monthlyCosts,
  });
  factory ScoreModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreModelFromJson(json);

  @override
  ScoreStatusEnum status;

  @override
  int annualIncome;

  @override
  int monthlyCosts;
}
