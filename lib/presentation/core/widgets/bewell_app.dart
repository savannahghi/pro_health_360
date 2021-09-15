import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/check_connectivity_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/connectivity_interface.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:myafyahub/presentation/core/widgets/app_entry_point.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class BewellApp extends StatefulWidget {
  const BewellApp(
      {Key? key,
      required this.navigatorObserver,
      required this.store,
      required this.connectivityStatus,
      required this.navigatorKey,
      required this.appContexts})
      : super(key: key);

  final NavigatorObserver navigatorObserver;
  final Store<AppState> store;
  final ConnectivityStatus connectivityStatus;
  final GlobalKey<NavigatorState> navigatorKey;
  final List<AppContext> appContexts;

  @override
  _BewellAppState createState() => _BewellAppState();

  @override
  String toStringShort() => 'myafyahub.app.main';
}

class _BewellAppState extends State<BewellApp> {
  FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics();

  @override
  void initState() {
    widget.connectivityStatus.onConnectivityChanged
        .listen((bool hasConnection) {
      if (hasConnection == false) {
        StoreProvider.dispatch<AppState>(
            context, CheckConnectivityAction(hasConnection: hasConnection));

        showToast('Internet connection lost');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppEntryPoint(
      appStore: widget.store,
      thisAppContexts: widget.appContexts,
      appName: testAppName,
      appNavigatorKey: widget.navigatorKey,
      appNavigatorObservers: <NavigatorObserver>[
        widget.navigatorObserver,
        SentryNavigatorObserver(),
        FirebaseAnalyticsObserver(analytics: firebaseAnalytics),
      ],
    );
  }
}
