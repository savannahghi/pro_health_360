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
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/update_home_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/infrastructure/endpoints.dart' as endpoints;

class CanRecordMoodAction extends ReduxAction<AppState> {
  CanRecordMoodAction({
    required this.context,
  });

  final BuildContext context;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(canRecordMoodFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(canRecordMoodFlag));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final String? userID = state.clientState!.user!.userId;

    // initializing of CanRecordMoodAction mutation
    final Map<String, String> _variables = <String, String>{
      'clientID': userID!,
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
    _client.idToken = state.credentials!.idToken!;
    _client.endpoint = endpoints.kTestGraphqlEndpoint;
    final http.Response result = await _client.query(
      canRecordMoodQuery,
      _variables,
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap['errors'] != null) {
      throw SILException(
        cause: canRecordMoodFlag,
        message: somethingWentWrongText,
      );
    }

    if (responseMap['data']['canRecordMood'] != null &&
        responseMap['data']['canRecordMood'] == true) {
      StoreProvider.dispatch(
        context,
        UpdateHomeStateAction(canRecordMood: true),
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
