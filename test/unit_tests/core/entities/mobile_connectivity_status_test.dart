// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/connectivity_interface.dart';
import 'package:myafyahub/domain/core/entities/core/mobile_connectivity_status.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel('plugins.flutter.io/connectivity')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'checkConnectivity') {
      return ConnectivityResult.mobile;
    }

    return null;
  });

  group('MobileConnectivityStatus', () {
    test('should return instance ', () {
      final MobileConnectivityStatus connection = MobileConnectivityStatus();
      expect(connection, isInstanceOf<MobileConnectivityStatus>());
      expect(connection.onConnectivityChanged, isA<Stream<bool>>());
      expect(getConnectivityStatus(), isInstanceOf<MobileConnectivityStatus>());
      expect(ConnectivityStatus.initial(), isInstanceOf<ConnectivityStatus>());
    });

    test('should check for connection ', () async {
      final MobileConnectivityStatus connection = MobileConnectivityStatus();
      expect(connection.checkConnection(), isA<Future<bool>>());
      final bool conn = await connection.checkConnection();
      expect(conn, false);

      expect(() => connection.onConnectivityChanged, returnsNormally);
    });
  });
}
