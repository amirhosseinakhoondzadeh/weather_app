import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@module
abstract class RegisterModule {
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();

  http.Client get client => http.Client();
}
