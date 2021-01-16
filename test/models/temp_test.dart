import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/temp.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  const Temp tTemp = Temp(
    day: 282.1,
    min: 278.63,
    max: 282.33,
    night: 278.93,
    eve: 281.33,
    morn: 279.21,
  );

  test('should return temp object from json', () {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('temp.json')) as Map<String, dynamic>;
    //act
    final result = Temp.fromJson(jsonMap);
    //assert
    expect(result, tTemp);
  });
}
