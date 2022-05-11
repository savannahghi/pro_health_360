import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as local_notifications;
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:myafyahub/application/core/services/localization.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/check_and_update_connectivity_action.dart';
import 'package:myafyahub/application/redux/actions/communities/connect_get_stream_user_action.dart';
import 'package:myafyahub/application/redux/actions/onboarding/check_token_action.dart';
import 'package:myafyahub/application/redux/actions/set_push_token_action.dart';
import 'package:myafyahub/application/redux/actions/update_misc_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/onboarding/initial_route_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/global_keys.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_interface.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_provider.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class PreLoadApp extends StatefulWidget {
  const PreLoadApp({
    Key? key,
    required this.thisAppContexts,
    required this.appName,
    required this.appNavigatorKey,
    required this.appNavigatorObservers,
    required this.entryPointContext,
    required this.appStore,
    required this.client,
    this.fcmToken,
  }) : super(key: key);

  final String appName;
  final GlobalKey<NavigatorState> appNavigatorKey;
  final List<NavigatorObserver> appNavigatorObservers;
  final Store<AppState> appStore;
  final BuildContext entryPointContext;
  final List<AppContext> thisAppContexts;
  final StreamChatClient client;
  final String? fcmToken;

  @override
  _PreLoadAppState createState() => _PreLoadAppState();
}

class _PreLoadAppState extends State<PreLoadApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addObserver(this);

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch(
        context,
        CheckTokenAction(
          httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
          refreshTokenEndpoint:
              AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
        ),
      );

      StoreProvider.dispatch(
        context,
        ConnectGetStreamUserAction(
          client: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
          streamClient: widget.client,
          endpoint: AppWrapperBase.of(context)!
              .customContext!
              .refreshStreamTokenEndpoint,
        ),
      );

      StoreProvider.dispatch(
        context,
        SetPushToken(
          token: widget.fcmToken ?? '',
          client: AppWrapperBase.of(context)!.graphQLClient,
          streamClient: widget.client,
        ),
      );

      FirebaseMessaging.instance.onTokenRefresh.listen((String newToken) {
        StoreProvider.dispatch(
          context,
          SetPushToken(
            client: AppWrapperBase.of(context)!.graphQLClient,
            token: newToken,
            streamClient: widget.client,
          ),
        );
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        handleNotification(
          message,
          widget.client,
        );
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    StoreProvider.dispatch(
      context,
      CheckTokenAction(
        httpClient: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
        refreshTokenEndpoint:
            AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint,
      ),
    );

    final ConnectivityChecker connectivityChecker =
        ConnectivityCheckerProvider.of(context).connectivityChecker;

    StoreProvider.dispatch(
      context,
      CheckAndUpdateConnectivityAction(
        connectivityChecker: connectivityChecker,
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final AppState? appState = StoreProvider.state<AppState>(context);
    final bool resumeWithPin = appState?.miscState?.resumeWithPin ?? false;
    if (state == AppLifecycleState.inactive && !resumeWithPin) {
      StoreProvider.dispatch<AppState>(
        context,
        UpdateMiscStateAction(inactiveTime: DateTime.now().toString()),
      );
    }

    if (state == AppLifecycleState.resumed &&
        resumeWithPIN(appState ?? AppState.initial())) {
      StoreProvider.dispatch<AppState>(
        context,
        UpdateMiscStateAction(resumeWithPin: true),
      );
      Navigator.pushReplacementNamed(
        appGlobalNavigatorKey.currentContext!,
        AppRoutes.resumeWithPin,
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialRouteViewModel>(
      converter: (Store<AppState> store) =>
          InitialRouteViewModel.fromStore(store.state),
      builder: (BuildContext context, InitialRouteViewModel vm) {
        final String initialRoute = vm.initialRoute ?? AppRoutes.phoneLogin;

        if (initialRoute == UNKNOWN) {
          return MaterialApp(
            theme: AppTheme.getAppTheme(),
            home: const Scaffold(
              body: Center(child: PlatformLoader()),
            ),
            localizationsDelegates: localizationDelegates,
            supportedLocales: locales,
          );
        }

        return MaterialApp(
          theme: AppTheme.getAppTheme(),
          debugShowCheckedModeBanner: widget.appName == testAppName,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: initialRoute,
          navigatorKey: widget.appNavigatorKey,
          navigatorObservers: widget.appNavigatorObservers,
          localizationsDelegates: localizationDelegates,
          supportedLocales: locales,
          builder: (BuildContext context, Widget? childWidget) {
            return UserExceptionDialog<AppState>(
              child: StreamChat(client: widget.client, child: childWidget),
            );
          },
        );
      },
    );
  }

  Future<void> handleNotification(
    RemoteMessage message,
    StreamChatClient chatClient,
  ) async {
    final Map<String, dynamic> data = message.data;

    if (data['type'] == 'message.new') {
      final local_notifications.FlutterLocalNotificationsPlugin
          flutterLocalNotificationsPlugin =
          local_notifications.FlutterLocalNotificationsPlugin();
      final String messageId = data['id'] as String;
      final GetMessageResponse response =
          await chatClient.getMessage(messageId);

      final String? channelName =
          response.channel?.extraData['Name'] as String?;

      const local_notifications.NotificationDetails notificationDetails =
          local_notifications.NotificationDetails(
        android: local_notifications.AndroidNotificationDetails(
          'new_message',
          'New message notifications channel',
        ),
      );
      flutterLocalNotificationsPlugin.show(
        1,
        newChatMessageTitle(
          response.message.user?.name,
          channelName,
        ),
        response.message.text,
        notificationDetails,
      );
    }
  }
}
