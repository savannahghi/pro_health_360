import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:afya_moja_core/src/domain/core/entities/notifications/notification_filter.dart';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/update_notifications_filter_state.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchNotificationFiltersAction extends ReduxAction<AppState> {
  FetchNotificationFiltersAction({
    required this.client,
  });

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchNotificationsFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(
      UpdateNotificationFilterStateAction(
        notificationFilters: <NotificationFilter>[],
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchNotificationsFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'flavour': Flavour.consumer.name,
    };

    final Response response =
        await client.query(fetchNotificationFilters, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    // add default filters
    final List<NotificationFilter> notificationFilters = <NotificationFilter>[];
    notificationFilters.addAll(<NotificationFilter>[
      NotificationFilter(name: 'All'),
      NotificationFilter(name: 'Read'),
      NotificationFilter(name: 'Unread'),
    ]);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('fetching notification filters'));
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      if (data != null && data['fetchNotificationTypeFilters'] != null) {
        for (final dynamic filter
            in data['fetchNotificationTypeFilters'] as List<dynamic>) {
          notificationFilters
              .add(NotificationFilter.fromJson(filter as Map<String, dynamic>));
        }

        dispatch(
          UpdateNotificationFilterStateAction(
            notificationFilters: notificationFilters,
          ),
        );
      } else {
        dispatch(
          UpdateNotificationFilterStateAction(
            notificationFilters: notificationFilters,
          ),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
