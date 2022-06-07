// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

Future<void> logUserEvent({
  required String name,
  Map<String, dynamic>? parameters,
  required AppState? state,
  required AnalyticsEventType eventType,
}) async {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  final Map<String, dynamic> enrichedParams = <String, dynamic>{};

  // Get the user ID and their names
  final String? userID = state!.clientState!.user!.userId;

  if (userID == UNKNOWN) {
    return;
  }

  enrichedParams.addAll(<String, dynamic>{
    'userID': userID,
    'eventType': describeEnum(eventType),
  });

  if (parameters != null) {
    enrichedParams.addAll(parameters);
  }

  await analytics.logEvent(name: name, parameters: enrichedParams);
}
