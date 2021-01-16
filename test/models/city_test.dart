import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/coord.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  const City tCity = City(
    coord: Coord(
      lat: 35.7447,
      lon: 51.3753,
    ),
    id: 112931,
    name: "Tehran",
    country: "IR",
    population: 7153309,
    timezone: 12600,
  );

  test('should return correct object from fronJson method', () {
    //arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('city.json')) as Map<String, dynamic>;
    //act
    final result = City.fromJson(jsonMap);
    //assert
    expect(result, tCity);
  });
}
