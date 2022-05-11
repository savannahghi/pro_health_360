// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_interface.dart';
import 'package:myafyahub/presentation/core/widgets/app_entry_point.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({
    Key? key,
    required this.navigatorObserver,
    required this.store,
    required this.connectivityChecker,
    required this.navigatorKey,
    required this.appSetupData,
    required this.streamClient,
    this.fcmToken,
  }) : super(key: key);

  final NavigatorObserver navigatorObserver;
  final Store<AppState> store;
  final ConnectivityChecker connectivityChecker;
  final GlobalKey<NavigatorState> navigatorKey;
  final AppSetupData appSetupData;
  final stream.StreamChatClient streamClient;
  final String? fcmToken;

  @override
  Widget build(BuildContext context) {
    return ConnectivityCheckerProvider(
      connectivityChecker: connectivityChecker,
      child: AppEntryPoint(
        streamClient: streamClient,
        appSetupData: appSetupData,
        appStore: store,
        appName: testAppName,
        appNavigatorKey: navigatorKey,
        fcmToken: fcmToken,
        appNavigatorObservers: <NavigatorObserver>[
          navigatorObserver,
          SentryNavigatorObserver(),
        ],
      ),
    );
  }
}
