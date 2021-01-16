import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants/api_keys.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/models/base_response.dart';

abstract class WeatherRemoteDataSource {
  Future<BaseResponse> getWeather(
      {@required double lat, double lon, String units});
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  const WeatherRemoteDataSourceImpl(this.client);

  @override
  Future<BaseResponse> getWeather(
      {double lat, double lon, String units}) async {
    final url =
        "https://api.openweathermap.org/data/2.5/forecast/daily?lat=$lat&lon=$lon&appid=$apiKey&cnt=7&units=$units";
    try {
      final response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return BaseResponse.fromJson(
            json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw ServerException(json.decode(response.body)['message'] as String);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
