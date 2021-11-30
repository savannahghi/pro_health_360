// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

/// [ShareContentAction] is a Redux Action whose job is to update the number of shares whenever a user shares content
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class ShareContentAction extends ReduxAction<AppState> {
  ShareContentAction({
    required this.contentID,
    required this.context,
  });

  final BuildContext context;
  final int contentID;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method

  @override
  Future<AppState> reduce() async {
    final String? userID =
        StoreProvider.state<AppState>(context)!.clientState!.user!.userId;

    // initializing of the LikeContent mutation
    final Map<String, dynamic> _variables = <String, dynamic>{
      'UserID': userID!,
      'ContentID': contentID,
      'Channel': 'SMS',
    };
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(
      shareContentMutation,
      shareContentMutationVariables(_variables),
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap['errors'] != null) {
      throw SILException(
        cause: shareContentFlag,
        message: somethingWentWrongText,
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
