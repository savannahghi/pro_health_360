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
import 'package:myafyahub/application/redux/actions/complete_onboarding_tour_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

/// [SetNicknameAction] is a Redux Action whose job is to update a users nickname,
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class SetNicknameAction extends ReduxAction<AppState> {
  SetNicknameAction({
    required this.context,
    required this.flag,
  });

  final BuildContext context;
  final String flag;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: flag);
  }

  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: flag, show: false);
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final String? userID =
        StoreProvider.state<AppState>(context)!.clientState!.user!.userId;
    final String? userName =
        StoreProvider.state<AppState>(context)!.clientState!.user!.username;

    // initializing of the SetNicknameAction mutation
    final Map<String, String> _variables = <String, String>{
      'userID': userID!,
      'nickname': userName!,
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

    if (_client.parseError(body) != null || responseMap['errors'] != null) {
      throw SILException(
        cause: setNickNameFlag,
        message: somethingWentWrongText,
      );
    }

    if (responseMap['data']['setNickName'] == true) {
      StoreProvider.dispatch(
        context,
        UpdateOnboardingStateAction(hasSetNickName: true),
      );
      StoreProvider.dispatch(
        context,
        CompleteOnboardingTourAction(
          context: context,
          flag: flag,
          userID: userID,
        ),
      );
      Navigator.pushReplacementNamed(
        context,
        BWRoutes.home,
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
