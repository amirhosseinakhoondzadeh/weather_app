import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/feels_like.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  const FeelsLike tFeelsLike =
      FeelsLike(day: 278.62, night: 274.17, eve: 278.23, morn: 276.07);

  test('should return FeelsLike object from json', () {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('feels_like.json')) as Map<String, dynamic>;
    //act
    final result = FeelsLike.fromJson(jsonMap);
    //assert
    expect(result, tFeelsLike);
  });
}
