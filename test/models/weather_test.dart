import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  const Weather tWeather = Weather(
    id: 803,
    main: "Clouds",
    description: "broken clouds",
    icon: "04d",
  );

  test('should return corrent weather from json', () {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('weather.json')) as Map<String, dynamic>;
    //act
    final result = Weather.fromJson(jsonMap);
    //assert
    expect(result, tWeather);
  });
}
