import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temp.freezed.dart';
part 'temp.g.dart';

@immutable
@freezed
abstract class Temp with _$Temp {
  const Temp._();
  const factory Temp({
    @required double day,
    @required double min,
    @required double max,
    @required double night,
    @required double eve,
    @required double morn,
  }) = _Temp;
  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);
}
