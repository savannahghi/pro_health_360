// Package imports:
import 'package:connectivity/connectivity.dart';

// Project imports:
import 'package:myafyahub/application/core/services/connectivity_helper.dart';
import 'package:myafyahub/domain/core/entities/core/connectivity_interface.dart';

class MobileConnectivityStatus extends ConnectivityStatus {
  MobileConnectivityStatus();

  final Connectivity _connectivity = Connectivity();

  @override
  Future<bool> checkConnection() async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    final bool hasConnection = result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;

    if (hasConnection == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Stream<bool> get onConnectivityChanged =>
      connectivityHelper(_connectivity, checkConnection);
}

MobileConnectivityStatus getConnectivityStatus() => MobileConnectivityStatus();
