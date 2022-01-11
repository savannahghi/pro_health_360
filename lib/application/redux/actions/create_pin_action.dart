// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
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
    this.phone,
    required this.context,
    required this.flag,
    required this.flavour,
  });

  final String? phone;
  final BuildContext context;
  final String flag;
  final String flavour;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
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
    final String? userID = state.clientState!.user!.userId;
    final String? newPIN = state.onboardingState!.createPINState!.newPIN;
    final String? confirmPIN =
        state.onboardingState!.createPINState!.confirmPIN;

    final String? otp = state.onboardingState?.verifyPhoneState?.otp;
    final bool isResetPin = state.onboardingState?.isResetPin ?? false;

    // check if the new PIN matches the confirmed PIN entered by the user
    if (newPIN == confirmPIN) {
      // initializing of the reset_pin mutation
      final Map<String, String?> _resetPinVariables = <String, String?>{
        'phonenumber': phone,
        'flavour': flavour,
        'pin': newPIN,
        'otp': otp,
      };

      // initializing of the updateUserPin mutation
      final Map<String, String?> _updateUserPinVariables = <String, String?>{
        'userID': userID,
        'pin': newPIN,
        'confirmPIN': confirmPIN,
        'flavour': flavour,
      };

      final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
      final String resetPinEndpoint =
          AppWrapperBase.of(context)!.customContext!.updateUserPinEndpoint;

      final http.Response result = isResetPin
          ? await _client.callRESTAPI(
              endpoint: resetPinEndpoint,
              method: httpPOST,
              variables: _resetPinVariables,
            )
          : await _client.query(
              setUserPINMutation,
              setUserPINMutationVariables(_updateUserPinVariables),
            );

      final Map<String, dynamic> body = _client.toMap(result);

      _client.close();

      final Map<String, dynamic> responseMap =
          json.decode(result.body) as Map<String, dynamic>;

      if (_client.parseError(body) != null || responseMap['errors'] != null) {
        throw SILException(
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
          BWRoutes.congratulationsPage,
          arguments: <String, String>{
            'duration': twoYearText,
          },
        );
      } else if (responseMap['data']['resetPIN'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(pinResetSuccessString),
            duration: Duration(seconds: 2),
          ),
        );

        StoreProvider.dispatch(
          context,
          UpdateOnboardingStateAction(isResetPin: false),
        );
        Navigator.pushReplacementNamed(
          context,
          BWRoutes.phoneLogin,
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
