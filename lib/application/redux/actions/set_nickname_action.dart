// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/complete_onboarding_tour_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

/// [SetNicknameAction] is a Redux Action whose job is to update a users nickname,
///
/// Otherwise delightfully notify user of any Error that might occur during the process
///
/// Should navigate is by default set to true unless when the action does not navigate to home page

class SetNicknameAction extends ReduxAction<AppState> {
  SetNicknameAction({
    required this.context,
    required this.flag,
    required this.nickName,
    this.shouldNavigate = true,
  });

  final BuildContext context;
  final String flag;
  final bool shouldNavigate;
  final String nickName;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void before() {
    super.before();
    toggleLoadingIndicator(context: context, flag: flag);
  }

  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: flag, show: false);
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String userID = state.clientState?.user?.userId ?? UNKNOWN;

    // initializing of the SetNicknameAction mutation
    final Map<String, String?> variables = <String, String?>{
      'userID': userID,
      'nickname': nickName,
    };
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await client.query(
      setNickNameMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);

    client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (client.parseError(body) != null || responseMap['errors'] != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: const Text(somethingWentWrongText),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeString, white, context),
          ),
        );

      Sentry.captureException(
        SILException(cause: setNickNameFlag, message: 'Error setting nickname'),
        stackTrace: responseMap,
      );

      return null;
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

      dispatch(UpdateUserProfileAction(nickName: nickName));

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
        Navigator.pushNamedAndRemoveUntil(
          context,
          BWRoutes.home,
          (Route<dynamic> route) => false,
        );
      }
    }

    return state;
  }
}
