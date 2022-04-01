// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/complete_onboarding_tour_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_info.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

/// [SetNicknameAction] is a Redux Action whose job is to update a users nickname,
///
/// Otherwise delightfully notify user of any Error that might occur during the process
///
/// Should navigate is by default set to true unless when the action does not navigate to home page

class SetNicknameAction extends ReduxAction<AppState> {
  SetNicknameAction({
    required this.context,
    required this.flag,
    this.shouldNavigate = true,
  });

  final BuildContext context;
  final String flag;
  final bool shouldNavigate;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(flag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(flag));
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final String userID = state.clientState!.user!.userId!;
    final String userName = state.clientState!.user!.username!;

    // initializing of the SetNicknameAction mutation
    final Map<String, String> _variables = <String, String>{
      'userID': userID,
      'nickname': userName,
    };
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(
      setNickNameMutation,
      _variables,
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;
    final String? errors = _client.parseError(body);

    if (errors != null || responseMap['errors'] != null) {
      if (errors!.contains('71')) {
        throw MyAfyaException(
          cause: setNickNameFlag,
          message: usernameTakenText,
        );
      }
      throw MyAfyaException(
        cause: setNickNameFlag,
        message: somethingWentWrongText,
      );
    }

    if (responseMap['data']['setNickName'] != null &&
        responseMap['data']['setNickName'] == true) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(nicknameSuccessString),
            duration: Duration(seconds: 2),
          ),
        );

      dispatch(
        UpdateOnboardingStateAction(hasSetNickName: true),
      );

      await dispatch(
        CompleteOnboardingTourAction(
          context: context,
          flag: flag,
          userID: userID,
        ),
      );

      if (shouldNavigate) {
        final OnboardingPathInfo path = onboardingPath(appState: state);

        Navigator.pushNamedAndRemoveUntil(
          context,
          path.nextRoute,
          (Route<dynamic> route) => false,
          arguments: path.arguments,
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
            action: dismissSnackBar(closeString, white, context),
          ),
        );
      return error;
    }
    return error;
  }
}
