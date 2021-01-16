import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/coord.dart';
part 'city.freezed.dart';
part 'city.g.dart';

@immutable
@freezed
abstract class City with _$City {
  const City._();

  const factory City({
    @required int id,
    @required String name,
    @required String country,
    @required int population,
    @required int timezone,
    @required Coord coord,
  }) = _City;
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
