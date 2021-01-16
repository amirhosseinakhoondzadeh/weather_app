import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:json_annotation/json_annotation.dart';
part 'coord.freezed.dart';
part 'coord.g.dart';

@immutable
@freezed
abstract class Coord extends Equatable with _$Coord {
  const Coord._();

  const factory Coord({
    @required double lon,
    @required double lat,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  @override
  List<Object> get props => [lat, lon];
}
