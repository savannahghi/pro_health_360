// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/content/update_reactions_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';

class FetchBookmarkStatusAction extends ReduxAction<AppState> {
  FetchBookmarkStatusAction({
    required this.contentDisplayedType,
    required this.context,
    required this.contentID,
  });

  final BuildContext context;
  final int contentID;
  final ContentDisplayedType contentDisplayedType;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchBookmarkStatusFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchBookmarkStatusFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': state.clientState!.user!.userId,
      'contentID': contentID
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final Response response = await _client.query(
      checkIfUserBookmarkedContentQuery,
      variables,
    );

    final Map<String, dynamic> responseMap = _client.toMap(response);
    final String? error = parseError(responseMap);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: fetchLikeStatusErrorString,
      );
      throw MyAfyaException(
        cause: fetchBookmarkStatusFlag,
        message: somethingWentWrongText,
      );
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['checkIfUserBookmarkedContent'] != null) {
      dispatch(
        UpdateReactionStatusAction(
          contentID: contentID,
          hasSaved: data?['checkIfUserBookmarkedContent'] as bool,
          contentDisplayedType: contentDisplayedType,
        ),
      );
    }

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text((error as MyAfyaException).message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
          ),
        );
      return error;
    }
    return error;
  }
}
