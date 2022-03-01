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
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

/// [CompleteOnboardingTourAction] is a Redux Action whose job is to update a users onboarding tour
/// completion status,
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class CompleteOnboardingTourAction extends ReduxAction<AppState> {
  CompleteOnboardingTourAction({
    required this.context,
    required this.flag,
    required this.userID,
  });

  final BuildContext context;
  final String flag;
  final String userID;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void before() {
    dispatch(WaitAction<AppState>.add(flag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(flag));
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    // initializing of the CompleteOnboardingTourAction mutation
    final Map<String, String> _variables = <String, String>{
      'userID': userID,
      'flavour': Flavour.consumer.name,
    };
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(
      completeOnboardingTourMutation,
      _variables,
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap['errors'] != null) {
      throw MyAfyaException(
        cause: setNickNameFlag,
        message: somethingWentWrongText,
      );
    }

    if (responseMap['data']['completeOnboardingTour'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(nicknameSuccessString),
          duration: Duration(seconds: 2),
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
