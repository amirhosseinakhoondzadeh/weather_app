// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data/network/weather_remote_datasource.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(get<Client>()));
  return get;
}
