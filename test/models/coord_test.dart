import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/coord.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  const tCoord = Coord(
    lat: 35.7447,
    lon: 51.3753,
  );

  test('should return a correct model from fromJson', () {
    //arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('coord.json')) as Map<String, dynamic>;
    //act
    final result = Coord.fromJson(jsonMap);
    //assert
    expect(result, tCoord);
  });
}
