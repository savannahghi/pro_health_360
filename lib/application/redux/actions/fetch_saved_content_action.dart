// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/update_saved_content_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/feed/saved_content.dart';

class FetchSavedContentAction extends ReduxAction<AppState> {
  FetchSavedContentAction({required this.context});

  final BuildContext context;
  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchSavedContentFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchSavedContentFlag));
    dispatch(
      UpdateSavedContentStateAction(
        errorFetchingContent: false,
        timeoutFetchingContent: false,
      ),
    );
  }

  @override
  Future<AppState?> reduce() async {
    final String? userID = state.clientState?.user?.userId;

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final Response response = await _client.query(
      getUserBookmarkedContentQuery,
      variables,
    );

    final Map<String, dynamic> payLoad = _client.toMap(response);
    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: 'Error while fetching your saved content',
      );

      if (error == 'timeout') {
        dispatch(UpdateSavedContentStateAction(timeoutFetchingContent: true));
        return null;
      }

      dispatch(UpdateSavedContentStateAction(errorFetchingContent: true));
      return null;
    }

    final SavedContent savedContent = SavedContent.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (savedContent.savedContent != null) {
      final List<Content?>? savedItems = savedContent.savedContent?.items;

      if (savedItems != null && savedItems.isNotEmpty) {
        dispatch(UpdateSavedContentStateAction(savedContentItems: savedItems));
      } else {
        dispatch(
          UpdateSavedContentStateAction(
            savedContentItems: <Content>[],
          ),
        );
      }
    }

    return state;
  }
}
