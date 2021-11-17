// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/remote_config_service.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/connectivity_interface.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/my_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> appBootStrap(List<AppContext> appContexts) async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  await Firebase.initializeApp();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  // initialize firebase remote config
  final RemoteConfigService remoteConfig =
      await RemoteConfigService.getInstance();
  remoteConfig.init();

  // final BeWellStateDatabase stateDB =
  //     BeWellStateDatabase(dataBaseName: silDatabaseName);

  final ConnectivityStatus connectivityStatus = ConnectivityStatus.initial();

  /// initialize the database
  // await stateDB.init();

  /// retrieve state from the database
  // final AppState initialState = await stateDB.readState();
  final AppState initialState = AppState.initial();

  /// initialize a fresh database if [initialState] is `null`,
  /// and populate the database with the default values for each state
  // if (initialState == AppState.initial()) {
  //   await stateDB.saveInitialState(initialState);
  // }

  final Store<AppState> store = Store<AppState>(
    initialState: initialState,
    // persistor: PersistorPrinterDecorator<AppState>(stateDB),
    defaultDistinct: true,
  );

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
          UserFeedBackTexts.getErrorMessage(),
          style: TextThemes.boldSize16Text(AppColors.whiteColor),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  };

  NavigateAction.setNavigatorKey(navigatorKey);

  final AppSetupData appSetupData = getAppSetupData(appContexts.last);

  runZonedGuarded(() async {
    await SentryFlutter.init(
      (SentryFlutterOptions options) {
        options
          ..dsn = appSetupData.sentryDsn
          ..diagnosticLevel = SentryLevel.error;
      },
      appRunner: () => runApp(
        MyApp(
          store: store,
          navigatorObserver: navigatorObserver,
          connectivityStatus: connectivityStatus,
          navigatorKey: navigatorKey,
          appSetupData: appSetupData,
        ),
      ),
    );

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      Sentry.captureException(details.exceptionAsString());
    };
  }, (Object exception, StackTrace stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
