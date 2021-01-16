// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'core/network_connection/network_connection.dart';
import 'third_party_modules_injection.dart';
import 'data/network/weather_remote_datasource.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<Client>(() => registerModule.client);
  gh.factory<DataConnectionChecker>(() => registerModule.dataConnectionChecker);
  gh.lazySingleton<NetworkConnection>(
      () => NetworkConnectionImpl(get<DataConnectionChecker>()));
  gh.lazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(get<Client>()));
  return get;
}

class _$RegisterModule extends RegisterModule {}
