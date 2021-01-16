import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/base_response.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/coord.dart';
import 'package:weather_app/models/feels_like.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/models/temp.dart';
import 'package:weather_app/models/weather.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  const BaseResponse tBaseResponse = BaseResponse(
    city: City(
        id: 112931,
        name: "Tehran",
        coord: Coord(lon: 51.3753, lat: 35.7447),
        country: "IR",
        population: 7153309,
        timezone: 12600),
    cod: "200",
    message: 6.5074658,
    cnt: 7,
    list: [
      ForecastData(
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
          feelsLike:
              FeelsLike(day: 278.62, night: 274.17, eve: 278.23, morn: 276.07),
          pressure: 1012,
          humidity: 45,
          weather: [
            Weather(
                id: 803,
                main: "Clouds",
                description: "broken clouds",
                icon: "04d")
          ],
          speed: 1.68,
          deg: 182,
          clouds: 80,
          pop: 0.3),
      ForecastData(
          dt: 1610785800,
          sunrise: 1610768602,
          sunset: 1610804681,
          temp: Temp(
              day: 282.15,
              min: 277.61,
              max: 283.46,
              night: 279.38,
              eve: 281.76,
              morn: 277.78),
          feelsLike:
              FeelsLike(day: 279.16, night: 275.47, eve: 279, morn: 273.71),
          pressure: 1017,
          humidity: 43,
          weather: [
            Weather(
                id: 800,
                main: "Clear",
                description: "sky is clear",
                icon: "01d")
          ],
          speed: 0.88,
          deg: 219,
          clouds: 0,
          pop: 0),
    ],
  );

  test('should return base rsponse object from json', () {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('base_response.json')) as Map<String, dynamic>;

    //act
    final result = BaseResponse.fromJson(jsonMap);
    //assert
    expect(result, tBaseResponse);
  });
}
