// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:debug_logger/debug_logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:html/dom.dart' as dom;
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/presentation/core/widgets/preload_app.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'onboarding_utils.dart';

/// [connectivityHelper] checks for changes in connection from the operating
/// system. This method is excluded from testing since there is no way to
/// simulate actual connection changes without a device
Stream<bool> connectivityHelper(
  Connectivity connectivity,
  Future<bool> Function() connectionChecker,
) {
  final Stream<bool> changeStream =
      connectivity.onConnectivityChanged.map<bool>(
    (ConnectivityResult event) =>
        event == ConnectivityResult.wifi || event == ConnectivityResult.mobile,
  );

  final Future<bool> res = connectionChecker();
  final Stream<bool> resAsStream = res.asStream();
  return resAsStream.mergeWith(<Stream<bool>>[changeStream]).distinct();
}

// onBodyLinkOrImageTapCallback open an in-app browser with the provided url
void onBodyLinkOrImageTapCallback(
  String? url,
  RenderContext context,
  Map<String, String> attributes,
  dom.Element? element,
) {
  launch(url!);
}

void publishEvent(String event, EventObject? payload) {
  final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics();
  firebaseAnalytics.logEvent(name: event, parameters: payload!.toJson());
}

void registerFCMTokenListener(BuildContext context) {
  SILFCM().onDeviceTokenRefresh().listen((String token) {
    // call register device token here but don't wait for it
    registerDeviceToken(
      client: AppWrapperBase.of(context)!.graphQLClient,
    );
  });
  void navigateFromPush(
    Map<String, dynamic>? data,
    String? title,
    String? body,
  ) {
    DebugLogger.debug(data);
  }

  SILFCM().configure(context: context, callback: navigateFromPush);
}

Function linkStreamListener({
  required bool mounted,
  required GlobalKey<NavigatorState> nav,
  required bool signedIn,
}) {
  return (Uri? uri) {
    if (!mounted) return;
    if (uri != null) {
      handleDeepLink(
        uri: uri,
        navigatorKey: nav,
        signedIn: signedIn,
      );
    }
  };
}

void handleDeepLink({
  required Uri uri,
  required GlobalKey<NavigatorState> navigatorKey,
  required bool signedIn,
  bool isInitialUri = false,
}) {
  final String route = '/${uri.path.split('/').last}';

  //if its the first deep link being handled
  if (isInitialUri) {
    final BehaviorSubject<String> appInitialRoute = BehaviorSubject<String>();
    //if user is signed in navigate to the deep link route
    if (signedIn) {
      //we navigate via the initial route and not via GlobalKey<NavigatorState>
      //because GlobalKey<NavigatorState> is null at this point it has not been configured by
      //MaterialApp yet
      appInitialRoute.add(route);
      //set deep link is handled to true
      initialUriIsHandled = true;
    } else {
      //defer deep link navigation until user has logged in or something
      queueLink(route, navigatorKey);
    }
  }

  //if its subsequent incoming deep links
  if (navigatorKey.currentState == null) return;

  if (unProtectedRoutes.contains(route)) {
    navigatorKey.currentState!.pushNamed(route);
    return;
  }

  // TODO: experiment with sending arguments too

  if (signedIn) {
    // navigate here to the route above
    navigatorKey.currentState!.pushNamed(route);
  } else {
    queueLink(route, navigatorKey);
  }
}

void queueLink(String route, GlobalKey<NavigatorState> navigatorKey) {
  final DeepLinkSubject deepLink = DeepLinkSubject();
  // save link and navigate later
  deepLink.hasLink.add(true);
  deepLink.link.add(route);
  deepLink.navigatorKey = navigatorKey;
}
