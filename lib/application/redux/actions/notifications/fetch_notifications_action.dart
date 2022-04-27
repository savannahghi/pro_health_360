import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/update_client_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/notification/notifications_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchNotificationsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;

  FetchNotificationsAction({
    required this.client,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchNotificationsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchNotificationsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String userID = state.clientState?.user?.userId ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'flavour': Flavour.pro.name,
      'paginationInput': <String, dynamic>{
        'Limit': 10,
        'CurrentPage': 1,
      }
    };

    final Response response =
        await client.query(listNotificationsQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('fetching notifications'));
      }

      final NotificationsResponse notificationsResponse =
          NotificationsResponse.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      final List<NotificationDetails> notifications =
          notificationsResponse.data.notifications;

      if (notifications.isNotEmpty) {
        dispatch(
          UpdateClientProfileAction(
            notifications: notifications,
          ),
        );
        return null;
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
