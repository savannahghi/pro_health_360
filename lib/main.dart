import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/notifications_utils.dart';
import 'package:pro_health_360/domain/core/value_objects/app_context_constants.dart';

import 'application/core/services/app_bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  appBootStrap(testAppContexts);
}
