import 'package:pro_health_360/infrastructure/connectivity/connectivity_status_stub.dart'
    if (dart.library.html) 'web_connectivity_status.dart'
    if (dart.library.io) 'mobile_connectivity_status.dart';

abstract class ConnectivityChecker {
  ConnectivityChecker();

  factory ConnectivityChecker.initial() => getConnectivityStatus();

  Stream<bool> get onConnectivityChanged;

  Future<bool> checkConnection();
}
