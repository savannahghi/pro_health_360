// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/exception_tag.dart';

/// [BookmarkContentAction] is a Redux Action whose job is to update saved content per user
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class BookmarkContentAction extends ReduxAction<AppState> {
  BookmarkContentAction({
    required this.contentID,
    required this.context,
  });

  final BuildContext context;
  final int contentID;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method

  @override
  Future<AppState> reduce() async {
    final String? userID = state.clientState!.user!.userId;

    // initializing of the LikeContent mutation
    final Map<String, dynamic> _variables = <String, dynamic>{
      'userID': userID!,
      'contentItemID': contentID,
    };
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response response = await _client.query(
      bookmarkContentMutation,
      _variables,
    );
    final Map<String, dynamic> responseMap = _client.toMap(response);
    final String? error = parseError(responseMap);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: 'Error while saving content',
      );
      throw SILException(
        cause: bookmarkContentTag,
        message: somethingWentWrongText,
      );
    }

    if (responseMap['data']['bookmarkContent'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackbar(
          content: const Text(contentSavedSuccessfully),
          durationSeconds: 2,
        ),
      );
    }

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeString, white, context),
          ),
        );
      return error;
    }
    return error;
  }
}
