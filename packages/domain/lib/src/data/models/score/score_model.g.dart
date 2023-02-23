// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreModel _$ScoreModelFromJson(Map<String, dynamic> json) => ScoreModel(
      status: $enumDecode(_$ScoreStatusEnumEnumMap, json['status']),
      annualIncome: json['annualIncome'] as int,
      monthlyCosts: json['monthlyCosts'] as int,
    );

Map<String, dynamic> _$ScoreModelToJson(ScoreModel instance) =>
    <String, dynamic>{
      'status': _$ScoreStatusEnumEnumMap[instance.status]!,
      'annualIncome': instance.annualIncome,
      'monthlyCosts': instance.monthlyCosts,
    };

const _$ScoreStatusEnumEnumMap = {
  ScoreStatusEnum.low: 'LOW',
  ScoreStatusEnum.medium: 'MEDIUM',
  ScoreStatusEnum.healthy: 'HEALTHY',
};
