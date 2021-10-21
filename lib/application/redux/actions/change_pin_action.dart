// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/logout_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';

/// [ChangePinAction] is a Redux Action whose job is to update a users PIN from an old one,
///  to the  new provided one
///
/// Otherwise delightfully notify user of any Error that might occur during update PIN process
///
/// should initiate change PIN process

class ChangePinAction extends ReduxAction<AppState> {
  ChangePinAction({required this.context, required this.flag});

  final BuildContext context;
  final String flag;

  ///  this method sets the loading indicator to show before start of execution of the `reduce()` method
  /// show is initially set to `true`
  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: flag, show: false);
    super.after();
  }

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: flag);
  }

  @override
  Future<AppState> reduce() async {
    final String phoneNumber = store
        .state.userProfileState!.userProfile!.primaryPhoneNumber!
        .getValue();

    final String? newChangedPin = store.state.miscState!.changePIN!.createPIN;

    final String? confirmedChangePin =
        store.state.miscState!.changePIN!.confirmPIN;

    // check if the new PIN matches the confirmed PIN entered by the user
    if (newChangedPin == confirmedChangePin) {
      // initializing of the updateUserPin mutation
      final Map<String, String?> variables = <String, String?>{
        'phone': phoneNumber,
        'pin': newChangedPin,
      };

      /// network request is made to the backend to request a PIN update/change
      final GraphQlClient _client =
          AppWrapperBase.of(context)!.graphQLClient as GraphQlClient;
      final http.Response response =
          await _client.query(updateUserPinMutation, variables);

      final Map<String, dynamic> _result = _client.toMap(response);

      if (_result['data']['updateUserPIN'] == true) {
        // dispatch action to update pin for the user in state
        store.dispatch(UpdatePinStatusAction(isChangingPin: false));

        genericBottomSheet(
          context: context,
          message: OnboardingStrings.changePINMsg,
          isError: false,
          primaryActionCallback: () {
            store.dispatch(
              LogoutAction(
                navigationCallback: () async {
                  await Navigator.of(context).pushNamedAndRemoveUntil(
                    BWRoutes.phoneLogin,
                    (Route<dynamic> route) => false,
                  );
                },
                context: context,
              ),
            );
          },
          primaryActionText: continueButtonText,
          buttonColor: AppColors.primaryColor,
        );
      } else {
        toggleLoadingIndicator(context: context, flag: flag, show: false);

        /// exception used to handle a `null` response from the backend
        return throw SILException(
          error: _result,
          cause: changePINActionError,
          message: changePINActionException,
        );
      }
    } else {
      toggleLoadingIndicator(context: context, flag: flag, show: false);
      // exception that handles a mismatch in the just entered PINs by the user
      return throw SILException(
        cause: pinMismatchError,
        message: pinMismatchException,
      );
    }

    return state;
  }

  ///  this method sets the loading indicator to hide after end of execution of the `reduce()` method4
  /// show is initially set to `true`
  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException && error.error != null) {
      reportErrorToSentry(context, error.error, hint: errorChangingPIN);
    }
    return actionWrapError(error: error, context: context);
  }
}
