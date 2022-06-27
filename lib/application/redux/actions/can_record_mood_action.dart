// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/update_home_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';

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
    super.before();
    dispatch(WaitAction<AppState>.add(canRecordMoodFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String? clientId = state.clientState!.id;

    // initializing of CanRecordMoodAction mutation
    final Map<String, String> _variables = <String, String>{
      'clientID': clientId!,
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
    final http.Response result = await _client.query(
      canRecordMoodQuery,
      _variables,
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap['errors'] != null) {
      throw MyAfyaException(
        cause: canRecordMoodFlag,
        message: somethingWentWrongText,
      );
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;
    if (data?['canRecordMood'] != null) {
      StoreProvider.dispatch(
        context,
        UpdateHomeStateAction(
          canRecordMood: data!['canRecordMood'] as bool,
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
            action: dismissSnackBar(closeString, white, context),
          ),
        );
      return error;
    }
    return error;
  }
}
