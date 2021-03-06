// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_recent_content_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class FetchRecentContentAction extends ReduxAction<AppState> {
  FetchRecentContentAction({
    required this.context,
    this.limit = 5,
  });

  final BuildContext context;
  final int limit;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchRecentContentFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchRecentContentFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'Limit': limit.toString()
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final Response response = await _client.query(
      getContentQuery,
      variables,
    );

    final Map<String, dynamic> payLoad = _client.toMap(response);
    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: 'Error while fetching your recent content',
      );

      if (error == 'timeout') {
        dispatch(UpdateRecentContentStateAction(timeoutFetchingContent: true));
        return null;
      }

      dispatch(UpdateRecentContentStateAction(errorFetchingContent: true));
      return null;
    }

    final FeedContent recentFeedContent = FeedContent.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (recentFeedContent.feedContent != null) {
      final List<Content?>? feedItems = recentFeedContent.feedContent?.items;

      if (feedItems != null && feedItems.isNotEmpty) {
        dispatch(UpdateRecentContentStateAction(contentItems: feedItems));
      } else {
        dispatch(
          UpdateRecentContentStateAction(
            contentItems: <Content>[],
          ),
        );
      }
    }

    return state;
  }
}
