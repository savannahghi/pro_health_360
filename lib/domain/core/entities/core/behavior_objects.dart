// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:

class InternetConnectivitySubject {
  factory InternetConnectivitySubject() {
    return _singleton;
  }

  InternetConnectivitySubject._internal();

  BehaviorSubject<bool> connectivitySubject =
      BehaviorSubject<bool>.seeded(true);

  static final InternetConnectivitySubject _singleton =
      InternetConnectivitySubject._internal();
}

class DeepLinkSubject {
  factory DeepLinkSubject() {
    return _singleton;
  }

  DeepLinkSubject._internal();

  BehaviorSubject<bool> hasLink = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<String> link = BehaviorSubject<String>();
  GlobalKey<NavigatorState>? navigatorKey;

  static final DeepLinkSubject _singleton = DeepLinkSubject._internal();
}
