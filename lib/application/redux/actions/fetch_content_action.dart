// Flutter imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/feed_content.dart';

class FetchContentAction extends ReduxAction<AppState> {
  FetchContentAction({required this.context, this.limit = 10});

  final BuildContext context;
  final int limit;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchContentFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchContentFlag));
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
        hint: 'Error while fetching your content',
      );

      if (error == 'timeout') {
        dispatch(UpdateContentStateAction(timeoutFetchingContent: true));
        return null;
      }

      dispatch(UpdateContentStateAction(errorFetchingContent: true));
      return null;
    }

    final FeedContent feedContent = FeedContent.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (feedContent.feedContent != null) {
      final List<Content?>? feedItems = feedContent.feedContent?.items;

      if (feedItems != null && feedItems.isNotEmpty) {
        dispatch(UpdateContentStateAction(contentItems: feedItems));
      }
    }

    return state;
  }
}
