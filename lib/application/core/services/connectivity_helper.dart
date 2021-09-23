import 'dart:async';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:debug_logger/debug_logger.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

import 'onboarding_utils.dart';

/// [connectivityHelper] checks for changes in connection from the operating
/// system. This method is excluded from testing since there is no way to
/// simulate actual connection changes without a device
Stream<bool> connectivityHelper(
    Connectivity connectivity, Future<bool> Function() connectionChecker) {
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
void onBodyLinkOrImageTapCallback(String? url, RenderContext context,
    Map<String, String> attributes, dom.Element? element) {
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

void moveCamera(
    LatLng _locationData, Completer<GoogleMapController> mapController) {
  mapController.future.then(
    (GoogleMapController controller) => controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _locationData,
          zoom: CAMERA_ZOOM,
          bearing: CAMERA_BEARING,
        ),
      ),
    ),
  );
}
