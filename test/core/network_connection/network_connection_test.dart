import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:weather_app/core/network_connection/network_connection.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkConnectionImpl networkConnection;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkConnection = NetworkConnectionImpl(mockDataConnectionChecker);
  });

  test(
    'should forward the call to DataConnectionChecker.hasConnection',
    () async {
      // arrange
      final tHasConnectionFuture = Future.value(true);

      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      // act
      final result = networkConnection.isConnected;

      // assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    },
  );
}
