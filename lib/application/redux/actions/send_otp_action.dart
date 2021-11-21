// Flutter imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:user_feed/user_feed.dart';

class SendOTPAction extends ReduxAction<AppState> {
  SendOTPAction({required this.context});

  final BuildContext context;

  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: sendOTPFlag, show: false);
    super.after();
  }

  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: sendOTPFlag);
  }

  @override
  Future<AppState?> reduce() async {
    final String userID = state.clientState!.user!.userId ?? UNKNOWN;
    final String phoneNumber =
        state.clientState!.user!.primaryContact!.value ?? UNKNOWN;

    if (userID != UNKNOWN && phoneNumber != UNKNOWN) {
      final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
      final Response result = await _client.query(
        sendOTPQuery,
        sendOTPQueryVariables(
          phoneNumber,
          Flavour.CONSUMER,
        ),
      );

      final Map<String, dynamic> data = _client.toMap(result);
      final String? parseError = _client.parseError(data);

      if (parseError != null) {
        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
        return null;
      }

      final String otp = data['data']['sendOTP'].toString();

      // save the OTP to state
      dispatch(UpdateOnboardingStateAction(otp: otp));

      return state;
    } else {
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
      return null;
    }
  }
}
