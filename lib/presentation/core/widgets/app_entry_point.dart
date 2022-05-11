// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/preload_app.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({
    Key? key,
    required this.appStore,
    required this.appName,
    required this.appNavigatorKey,
    required this.appNavigatorObservers,
    required this.appSetupData,
    required this.streamClient,
    this.fcmToken,
  }) : super(key: key);

  final String appName;
  final GlobalKey<NavigatorState> appNavigatorKey;
  final List<NavigatorObserver> appNavigatorObservers;
  final Store<AppState> appStore;
  final AppSetupData appSetupData;
  final stream.StreamChatClient streamClient;
  final String? fcmToken;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      key: globalStoreKey,
      store: appStore,
      child: StoreConnector<AppState, AppEntryPointViewModel>(
        vm: () => AppEntryPointViewModelFactory(),
        builder: (BuildContext context, AppEntryPointViewModel vm) {
          final String idToken = vm.idToken ?? '';
          final String graphqlEndpoint =
              appSetupData.customContext!.graphqlEndpoint;
          final String refreshTokenEndpoint =
              appSetupData.customContext?.refreshTokenEndpoint ?? '';
          final String userID = vm.userId ?? '';

          return AppWrapper(
            appName: appName,
            appContexts: appSetupData.appContexts,
            graphQLClient: CustomClient(
              idToken,
              graphqlEndpoint,
              context: context,
              refreshTokenEndpoint: refreshTokenEndpoint,
              userID: userID,
            ),
            baseContext: appSetupData.customContext,
            child: PreLoadApp(
              thisAppContexts: appSetupData.appContexts,
              appName: appName,
              appNavigatorKey: appNavigatorKey,
              appNavigatorObservers: appNavigatorObservers,
              entryPointContext: context,
              appStore: appStore,
              client: streamClient,
              fcmToken: fcmToken,
            ),
          );
        },
      ),
    );
  }
}

class AppEntryPointViewModelFactory extends VmFactory<AppState, AppEntryPoint> {
  @override
  AppEntryPointViewModel fromStore() {
    return AppEntryPointViewModel(
      idToken: state.credentials?.idToken,
      userId: state.clientState?.user?.userId,
    );
  }
}

class AppEntryPointViewModel extends Vm {
  AppEntryPointViewModel({
    required this.idToken,
    required this.userId,
  }) : super(equals: <Object?>[idToken, userId]);

  final String? idToken;
  final String? userId;
}
