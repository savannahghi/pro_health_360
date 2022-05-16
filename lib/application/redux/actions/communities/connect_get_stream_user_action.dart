import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:myafyahub/application/communities/stream_token_provider.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class ConnectGetStreamUserAction extends ReduxAction<AppState> {
  final stream.StreamChatClient streamClient;
  final IGraphQlClient client;
  final StreamTokenProvider streamTokenProvider;

  ConnectGetStreamUserAction({
    required this.streamClient,
    required this.client,
    required this.streamTokenProvider,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(connectionFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(connectionFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String clientId = state.clientState?.id ?? '';

    if (clientId.isEmpty || clientId == UNKNOWN) {
      throw const UserException(kindlyLogOutText);
    }

    try {
      if (streamClient.wsConnectionStatus ==
              stream.ConnectionStatus.connected ||
          streamClient.wsConnectionStatus ==
              stream.ConnectionStatus.connecting) {
        return null;
      }

      final User? user = state.clientState?.user;

      final String? name = user?.name;
      final String? username = user?.username;
      final String? userId = user?.userId;

      await streamClient.connectUserWithProvider(
        stream.User(
          id: clientId,
          name: name,
          extraData: <String, dynamic>{
            'username': username,
            'userType': 'CLIENT',
            'userID': userId,
          },
        ),
        streamTokenProvider.tokenProvider,
      );
    } on stream.StreamWebSocketError catch (e) {
      switch (e.errorCode) {
        case stream.ChatErrorCode.undefinedToken:
        case stream.ChatErrorCode.tokenExpired:
        case stream.ChatErrorCode.tokenBeforeIssuedAt:
        case stream.ChatErrorCode.tokenNotValid:
        case stream.ChatErrorCode.tokenSignatureInvalid:
          Sentry.captureException(
            e,
            hint: e.message,
          );
          throw UserException(getErrorMessage());
        default:
          Sentry.captureException(
            e,
            hint: e.message,
          );
      }
    } catch (e) {
      Sentry.captureException(e);
      throw UserException(getErrorMessage());
    }

    return null;
  }
}
