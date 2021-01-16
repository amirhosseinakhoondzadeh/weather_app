import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/feels_like.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/models/temp.dart';
import 'package:weather_app/models/weather.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  const ForecastData tForecastData = ForecastData(
    dt: 1610699400,
    sunrise: 1610682220,
    sunset: 1610718222,
    temp: Temp(
        day: 282.1,
        min: 278.63,
        max: 282.33,
        night: 278.93,
        eve: 281.33,
        morn: 279.21),
    feelsLike: FeelsLike(day: 278.62, night: 274.17, eve: 278.23, morn: 276.07),
    pressure: 1012,
    humidity: 45,
    weather: [
      Weather(
          id: 803, main: "Clouds", description: "broken clouds", icon: "04d")
    ],
    speed: 1.68,
    deg: 182,
    clouds: 80,
    pop: 0.3,
  );

  test('should return forecast object from json', () {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('forecast_data.json')) as Map<String, dynamic>;

    //act
    final result = ForecastData.fromJson(jsonMap);
    //assert
    expect(result, tForecastData);
  });
}
