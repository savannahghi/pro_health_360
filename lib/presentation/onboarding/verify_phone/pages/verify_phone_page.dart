import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/resend_otp_action.dart';
import 'package:pro_health_360/application/redux/actions/send_otp_action.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/actions/verify_otp_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/verify_phone_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/onboarding/verify_phone/pages/verify_phone_widget.dart';

class VerifyPhonePage extends StatelessWidget {
  const VerifyPhonePage();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VerifyPhoneViewModel>(
      converter: (Store<AppState> store) {
        return VerifyPhoneViewModel.fromStore(store.state);
      },
      builder: (BuildContext context, VerifyPhoneViewModel vm) {
        final String phoneNumber = vm.phoneNumber ?? UNKNOWN;

        return VerifyPhoneWidget(
          vm: vm,
          sendOTPFunction: () async {
            StoreProvider.dispatch<AppState>(
              context,
              SendOTPAction(context: context, phoneNumber: phoneNumber),
            );
            AnalyticsService().logEvent(
              name: sendOTPEvent,
              eventType: AnalyticsEventType.ONBOARDING,
            );
          },
          canResendOTPFunction: () async {
            StoreProvider.dispatch<AppState>(
              context,
              UpdateOnboardingStateAction(canResendOTP: true),
            );
          },
          cantResendOTPFunction: () async {
            StoreProvider.dispatch<AppState>(
              context,
              UpdateOnboardingStateAction(canResendOTP: false),
            );
          },
          onDone: (String enteredCode) {
            if (enteredCode == vm.otp) {
              StoreProvider.dispatch<AppState>(
                context,
                VerifyOTPAction(otp: enteredCode, context: context),
              );
            } else {
              showFeedbackBottomSheet(
                context: context,
                modalContent: invalidCode,
                imageAssetPath: errorIconUrl,
              );
            }
          },
          resendOTPFunction: () async {
            StoreProvider.dispatch<AppState>(
              context,
              ResendOTPAction(context: context, phoneNumber: phoneNumber),
            );
            AnalyticsService().logEvent(
              name: resendOTPEvent,
              eventType: AnalyticsEventType.ONBOARDING,
            );
          },
        );
      },
    );
  }
}
