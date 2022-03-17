// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/exception_tag.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

/// [CreatePINAction] is a Redux Action whose job is to update a users PIN from an old one,
///  to the new provided one
///
/// Otherwise delightfully notify user of any Error that might occur during update PIN process
///
/// should initiate change PIN process

class CreatePINAction extends ReduxAction<AppState> {
  CreatePINAction({
    required this.context,
  });

  final BuildContext context;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createPinFlag));
    super.after();
  }

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  void before() {
    dispatch(WaitAction<AppState>.add(createPinFlag));
  }

  @override
  Future<AppState> reduce() async {
    final String? userID = state.clientState!.user!.userId;
    final String? newPIN = state.onboardingState!.createPINState!.newPIN;
    final String? confirmPIN =
        state.onboardingState!.createPINState!.confirmPIN;

    // check if the new PIN matches the confirmed PIN entered by the user
    if (newPIN == confirmPIN) {
      // initializing of the updateUserPin mutation
      final Map<String, String?> setUserPINVariables = <String, String?>{
        'userID': userID,
        'pin': newPIN,
        'confirmPIN': confirmPIN,
        'flavour': Flavour.consumer.name,
      };

      final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

      final http.Response result = await _client.query(
        setUserPINMutation,
        setUserPINMutationVariables(setUserPINVariables),
      );

      final Map<String, dynamic> body = _client.toMap(result);

      _client.close();

      final Map<String, dynamic> responseMap =
          json.decode(result.body) as Map<String, dynamic>;

      if (_client.parseError(body) != null || responseMap['errors'] != null) {
        throw MyAfyaException(
          cause: createPINTag,
          message: somethingWentWrongText,
        );
      }

      if (responseMap['data']['setUserPIN'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(pinSuccessString),
            duration: Duration(seconds: 2),
          ),
        );

        StoreProvider.dispatch(
          context,
          UpdateOnboardingStateAction(hasSetPin: true),
        );

        Navigator.pushReplacementNamed(
          context,
          AppRoutes.congratulationsPage,
          arguments: <String, String>{
            'duration': twoYearText,
          },
        );
      }
    } else {
      // scaffold that handles a mismatch in the just entered PINs by the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(pinMustMatchString),
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
