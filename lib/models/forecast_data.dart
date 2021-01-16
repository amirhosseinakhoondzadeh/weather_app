import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/feels_like.dart';
import 'package:weather_app/models/temp.dart';
import 'package:weather_app/models/weather.dart';

part 'forecast_data.freezed.dart';
part 'forecast_data.g.dart';

@immutable
@freezed
abstract class ForecastData with _$ForecastData {
  const ForecastData._();

  const factory ForecastData({
    num dt,
    Temp temp,
    num sunrise,
    num sunset,
    @JsonKey(name: 'feels_like') @required FeelsLike feelsLike,
    num pressure,
    num humidity,
    List<Weather> weather,
    double speed,
    int deg,
    int clouds,
    double rain,
    double snow,
    double pop,
  }) = _ForecastData;
  factory ForecastData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataFromJson(json);
}
