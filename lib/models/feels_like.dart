import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feels_like.freezed.dart';
part 'feels_like.g.dart';

@immutable
@freezed
abstract class FeelsLike with _$FeelsLike {
  const FeelsLike._();

  const factory FeelsLike({
    @required double day,
    @required double night,
    @required double eve,
    @required double morn,
  }) = _FeelsLike;

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);
}
