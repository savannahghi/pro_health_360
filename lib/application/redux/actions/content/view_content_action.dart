import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/redux/actions/update_content_engagement_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ViewContentAction extends ReduxAction<AppState> {
  ViewContentAction({
    required this.client,
    required this.contentID,
    this.onFailure,
  });

  final IGraphQlClient client;
  final int contentID;
  final VoidCallback? onFailure;

  @override
  void before() {
    // record the time the content was tapped for viewing
    store.dispatch(
      UpdateContentEngagementStateAction(
        contentId: contentID,
        contentOpenedAt: DateTime.now().toString(),
      ),
    );
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': state.clientState!.user!.userId,
      'contentID': contentID
    };

    /// fetch the data from the api
    final Response response = await client.query(
      viewContentMutation,
      variables,
    );
    final Map<String, dynamic> responseMap = client.toMap(response);

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['viewContent'] != null) return state;

    final String? error = parseError(responseMap);

    if (error != null) {
      onFailure?.call();
      Sentry.captureException(
        error,
        hint: <String, dynamic>{
          'query': viewContentMutation,
          'variables': variables,
          'response': response.body,
        },
      );
    }

    return state;
  }
}
