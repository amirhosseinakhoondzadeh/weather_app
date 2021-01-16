import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants/api_keys.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/data/network/weather_remote_datasource.dart';
import 'package:weather_app/models/base_response.dart';

import '../../fixtures/fixture_reader.dart';


class MockHttpClient extends Mock implements http.Client {}

void main() {
  WeatherRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = WeatherRemoteDataSourceImpl(mockHttpClient);
  });

  test(
      '''should perform a GET request on the given url with application/json header''',
      () async {
    //arrange
    when(
      mockHttpClient.get(
        any,
        headers: anyNamed('headers'),
      ),
    ).thenAnswer(
        (_) async => http.Response(fixture('base_response.json'), 200));
    //act
    dataSource.getWeather(lat: 35.7447, lon: 51.3753, units: "standard");
    //assert
    final url =
        "https://api.openweathermap.org/data/2.5/forecast/daily?lat=35.7447&lon=51.3753&appid=$apiKey&cnt=7&units=standard";
    verify(
      mockHttpClient.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  });

  test('should return BaseResponse object when the call is successfull',
      () async {
    //arrange
    when(
      mockHttpClient.get(
        any,
        headers: anyNamed('headers'),
      ),
    ).thenAnswer(
        (_) async => http.Response(fixture('base_response.json'), 200));

    // act
    final result = await dataSource.getWeather(
        lat: 35.7447, lon: 51.3753, units: "standard");

    //assert
    expect(result, isA<BaseResponse>());
  });

  test('should throw ServerException when the call is unsuccessfull', () async {
    //arrange
    when(
      mockHttpClient.get(
        any,
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async => http.Response('Unauthorized request', 401));

    // act
    final call = dataSource.getWeather;

    //assert
    expect(() => call(lat: 35.7447, lon: 51.3753, units: "standard"),
        throwsA(const TypeMatcher<ServerException>()));
  });
}
