import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

Future<void> backgroundMessageHandler(
  RemoteMessage message, {
  @visibleForTesting stream.StreamChatClient? testChatClient,
}) async {
  await Firebase.initializeApp();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String streamToken = prefs.getString('streamToken') ?? '';
  final String clientId = prefs.getString('clientId') ?? '';
  final String streamAPIKey = prefs.getString('streamApiKey') ?? '';

  late stream.StreamChatClient streamClient;

  if (testChatClient != null) {
    streamClient = testChatClient;
  } else {
    streamClient = stream.StreamChatClient(
      streamAPIKey,
      logLevel: stream.Level.ALL,
    );
  }

  streamClient.connectUser(
    stream.User(id: clientId),
    streamToken,
    connectWebSocket: false,
  );

  handleNotification(message, streamClient);
}
