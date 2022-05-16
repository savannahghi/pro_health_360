import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/app_bootstrap.dart';
import 'package:myafyahub/application/core/services/notifications_utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  appBootStrap(demoAppContexts);
}
