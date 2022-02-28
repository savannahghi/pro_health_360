// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';

// Project imports:
import 'package:myafyahub/infrastructure/connectivity/connectivity_helper.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_interface.dart';

class MobileConnectivityStatus extends ConnectivityStatus {
  MobileConnectivityStatus({Future<bool> Function()? checkInternetCallback})
      : _hasConnection = false,
        checkInternetCallback = checkInternetCallback ?? checkInternet {
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
        if (result != ConnectivityResult.none) {
          checkConnection();
        } else {
          _hasConnection = false;
          _connectionChangeController.add(false);
        }
      });
    }
  }

  late bool _hasConnection;
  final Future<bool> Function() checkInternetCallback;

  final Connectivity _connectivity = Connectivity();

  final StreamController<bool> _connectionChangeController =
      StreamController<bool>.broadcast();

  @override
  Future<bool> checkConnection() async {
    final bool previousConnection = _hasConnection;

    _hasConnection = await checkInternetCallback();

    if (previousConnection != _hasConnection) {
      _connectionChangeController.add(_hasConnection);
    }

    return _hasConnection;
  }

  @override
  Stream<bool> get onConnectivityChanged => _connectionChangeController.stream;
}

MobileConnectivityStatus getConnectivityStatus() => MobileConnectivityStatus();
