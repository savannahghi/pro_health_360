import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_connectivity_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_database_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/global_keys.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_interface.dart';
import 'package:myafyahub/infrastructure/repository/database_state_persistor.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/my_app_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> appBootStrap(List<AppContext> appContexts) async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  final MyAfyaHubStateDatabase stateDB =
      MyAfyaHubStateDatabase(dataBaseName: silDatabaseName);

  /// initialize the database
  await stateDB.init();

  /// retrieve state from the database
  final AppState initialState = await stateDB.readState();

  /// initialize a fresh database if [initialState] is `null`,
  /// and populate the database with the default values for each state
  if (initialState == AppState.initial()) {
    await stateDB.saveInitialState(initialState);
  }

  final Store<AppState> store = Store<AppState>(
    initialState: initialState,
    persistor: PersistorPrinterDecorator<AppState>(stateDB),
    defaultDistinct: true,
  );

  final ConnectivityChecker connectivityChecker = ConnectivityChecker.initial();

  connectivityChecker
      .checkConnection()
      .asStream()
      .mergeWith(
        <Stream<bool>>[connectivityChecker.onConnectivityChanged],
      )
      .distinct()
      .listen((bool hasConnection) {
        store.dispatch(UpdateConnectivityAction(hasConnection: hasConnection));
      });

  final NavigatorObserver navigatorObserver = NavigatorObserver();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(
      () {
        inDebug = true;
        return true;
      }(),
    );
    // In debug mode, use the normal error widget which shows
    if (inDebug) {
      return ErrorWidget(details.exception);
    }

    // In release builds, show error image
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(errorDisplayImgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          getErrorMessage(),
          style: boldSize16Text(AppColors.whiteColor),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  };

  NavigateAction.setNavigatorKey(appGlobalNavigatorKey);

  final AppSetupData appSetupData = getAppSetupData(appContexts.last);

  final StreamChatClient streamClient = StreamChatClient(
    appSetupData.streamAPIKey,
    logLevel: Level.ALL,
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('streamApiKey', appSetupData.streamAPIKey);

  await Firebase.initializeApp();
  final String? fcmToken = await FirebaseMessaging.instance.getToken();

  runZonedGuarded(
    () async {
      await SentryFlutter.init(
        (SentryFlutterOptions options) {
          options
            ..dsn = appSetupData.sentryDsn
            ..diagnosticLevel = SentryLevel.error;
        },
        appRunner: () => runApp(
          MyAppWidget(
            streamClient: streamClient,
            store: store,
            navigatorObserver: navigatorObserver,
            connectivityChecker: connectivityChecker,
            navigatorKey: appGlobalNavigatorKey,
            appSetupData: appSetupData,
            fcmToken: fcmToken,
          ),
        ),
      );

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        Sentry.captureException(details.exceptionAsString());
      };
    },
    (Object exception, StackTrace stackTrace) async {
      await Sentry.captureException(exception, stackTrace: stackTrace);
    },
  );
}
