import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkConnection {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkConnection)
class NetworkConnectionImpl implements NetworkConnection {
  final DataConnectionChecker dataConnectionChecker;

  NetworkConnectionImpl(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
