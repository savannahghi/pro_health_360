// Flutter imports:
// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';
import 'package:myafyahub/domain/core/entities/feed/feed_content.dart';

class FetchContentAction extends ReduxAction<AppState> {
  FetchContentAction({
    required this.context,
    this.limit = 10,
    this.category,
  });

  final BuildContext context;
  final int limit;
  final ContentCategory? category;

  @override
  void before() {
    super.before();
    dispatch(
      UpdateContentStateAction(
        selectedCategory: category ?? ContentCategory.initial(),
        timeoutFetchingContent: false,
        errorFetchingContent: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchContentFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchContentFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final ContentCategory selectedCategory =
        category ?? ContentCategory.initial();

    final Map<String, dynamic> variables = <String, dynamic>{
      'categoryID': selectedCategory.id == 0 ? null : selectedCategory.id,
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
        dispatch(
          UpdateContentStateAction(contentItems: feedItems),
        );
      } else {
        dispatch(
          UpdateContentStateAction(
            contentItems: <Content>[],
            timeoutFetchingContent: false,
            errorFetchingContent: false,
          ),
        );
      }
    }

    return state;
  }
}
