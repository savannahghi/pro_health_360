// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/complete_onboarding_tour_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_info.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// [SetNicknameAction] is a Redux Action whose job is to update a users nickname,
///
/// Otherwise delightfully notify user of any Error that might occur during the process
///
/// Should navigate is by default set to true unless when the action does not navigate to home page

class SetNicknameAction extends ReduxAction<AppState> {
  SetNicknameAction({
    required this.flag,
    required this.client,
    required this.nickname,
    this.shouldNavigate = true,
    this.onError,
    this.onSuccess,
  });

  final String flag;
  final IGraphQlClient client;
  final String nickname;
  final bool shouldNavigate;
  final void Function(String)? onError;
  final void Function()? onSuccess;

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
  Future<AppState?> reduce() async {
    final String? userID = state.clientState?.user?.userId;
    final String? userName = state.clientState?.user?.username;

    // initializing of the SetNicknameAction mutation
    final Map<String, String?> variables = <String, String?>{
      'userID': userID,
      'nickname': userName,
    };

    final http.Response result = await client.query(
      setNickNameMutation,
      variables,
    );

    final ProcessedResponse processed = processHttpResponse(result);

    if (processed.ok) {
      final Map<String, dynamic> body = client.toMap(result);
      client.close();
      final String? errors = client.parseError(body);

      if (errors != null) {
        if (errors.contains('71')) {
          onError?.call(usernameTakenText);
          return null;
        }

        onError?.call(somethingWentWrongText);
        Sentry.captureException(UserException(errors));

        return null;
      }

      if (body['data']['setNickName'] == true) {
        dispatch(UpdateOnboardingStateAction(hasSetNickName: true));
        dispatch(UpdateUserProfileAction(nickName: nickname));

        onSuccess?.call();

        await dispatch(
          CompleteOnboardingTourAction(
            client: client,
            userID: userID,
          ),
        );

        if (shouldNavigate) {
          final OnboardingPathInfo path = onboardingPath(appState: state);

          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              path.nextRoute,
              (Route<dynamic> route) => false,
              arguments: path.arguments,
            ),
          );
        }
      } else {
        onError?.call(errorSettingNicknameText);
        return null;
      }
    } else {
      throw UserException(getErrorMessage());
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
