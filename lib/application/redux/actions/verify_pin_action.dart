import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_pin_input_details_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/constants.dart';

class VerifyPINAction extends ReduxAction<AppState> {
  VerifyPINAction({
    required this.inputPIN,
    required this.context,
  });

  final String inputPIN;
  final BuildContext context;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(verifyPINFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(verifyPINFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final int tries = state.miscState?.pinInputTries ?? 0;
    final String? userID = state.clientState?.user?.userId;
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'flavour': Flavour.consumer.name,
      'pin': inputPIN,
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final Response response = await _client.query(
      verifyPinQuery,
      variables,
    );

    final Map<String, dynamic> responseMap = _client.toMap(response);
    final String? error = parseError(responseMap);

    if (error != null) {
      if (error.contains('wrong PIN')) {
        dispatch(
          UpdatePINInputDetailsAction(
            pinInputTries: tries + 1,
            pinVerified: false,
          ),
        );
        return state;
      } else {
        reportErrorToSentry(
          context,
          error,
          hint: 'Error while verifying user PIN',
        );
      }

      throw MyAfyaException(
        cause: verifyPinQuery,
        message: somethingWentWrongText,
      );
    }
    if (responseMap['data']['verifyPIN'] != null) {
      final bool pinVerified = responseMap['data']['verifyPIN'] as bool;
      if (pinVerified) {
        dispatch(
          UpdatePINInputDetailsAction(
            pinInputTries: 0,
            pinVerified: pinVerified,
            healthPagePINInputTime: DateTime.now().toString(),
            maxTryTime: '',
          ),
        );
        navigateToNewPage(
          context: context,
          route: AppRoutes.myHealthPage,
          bottomNavIndex: 2,
        );
      }
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
          ),
        );
      return error;
    }
    return error;
  }
}
