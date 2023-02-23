import 'package:json_annotation/json_annotation.dart';

enum ScoreStatusEnum {
  @JsonValue('LOW')
  low,
  @JsonValue('MEDIUM')
  medium,
  @JsonValue('HEALTHY')
  healthy,
}
