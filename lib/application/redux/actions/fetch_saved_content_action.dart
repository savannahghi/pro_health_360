import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_saved_content_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/saved_content.dart';

class FetchSavedContentAction extends ReduxAction<AppState> {
  FetchSavedContentAction({
    required this.context,
  });

  final BuildContext context;
  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchSavedContentFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchSavedContentFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String userID =
        StoreProvider.state<AppState>(context)!.clientState!.user!.userId!;
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
