import 'connectivity_status_stub.dart'
    if (dart.library.html) 'web_connectivity_status.dart'
    if (dart.library.io) 'mobile_connectivity_status.dart';

abstract class ConnectivityStatus {
  ConnectivityStatus();

  factory ConnectivityStatus.initial() => getConnectivityStatus();

  Stream<bool> get onConnectivityChanged;

  Future<bool> checkConnection();
}