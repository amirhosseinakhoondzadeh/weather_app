import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/city.dart';

import 'forecast_data.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@immutable
@freezed
abstract class BaseResponse with _$BaseResponse {
  const BaseResponse._();
  const factory BaseResponse({
    @required City city,
    @required String cod,
    @required double message,
    @required int cnt,
    @required List<ForecastData> list,
  }) = _BaseResponse;
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}
