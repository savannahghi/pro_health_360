import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/resend_otp_action.dart';
import 'package:myafyahub/application/redux/actions/send_otp_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/verify_otp_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/verify_phone_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/pages/verify_phone_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class VerifyPhonePage extends StatefulWidget {
  const VerifyPhonePage();

  @override
  State<VerifyPhonePage> createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VerifyPhoneViewModel>(
      converter: (Store<AppState> store) {
        return VerifyPhoneViewModel.fromStore(store);
      },
      builder: (BuildContext context, VerifyPhoneViewModel vm) {
        String activeNumber;

        final String phoneNumber = vm.phoneNumber ?? UNKNOWN;
        final String onboardingPhoneNumber =
            vm.onboardingPhoneNumber ?? UNKNOWN;

        if (phoneNumber != UNKNOWN) {
          activeNumber = phoneNumber;
        } else {
          activeNumber = onboardingPhoneNumber;
        }

        return VerifyPhoneWidget(
          vm: vm,
          sendOTPFunction: () async {
            StoreProvider.dispatch<AppState>(
              context,
              SendOTPAction(
                context: context,
                phoneNumber: activeNumber,
              ),
            );
          },
          canResendOTPFunction: () async {
            StoreProvider.dispatch<AppState>(
              context,
              UpdateOnboardingStateAction(
                canResendOTP: true,
              ),
            );
          },
          cantResendOTPFunction: () async {
            StoreProvider.dispatch<AppState>(
              context,
              UpdateOnboardingStateAction(
                canResendOTP: false,
              ),
            );
          },
          onDone: (String enteredCode) {
            if (enteredCode == vm.otp) {
              if (vm.isResetPin) {
                Navigator.pushNamed(
                  context,
                  AppRoutes.createPin,
                );
              } else {
                StoreProvider.dispatch<AppState>(
                  context,
                  VerifyOTPAction(
                    otp: enteredCode,
                    context: context,
                  ),
                );
              }
              return;
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
              ResendOTPAction(
                context: context,
                phoneNumber: activeNumber,
              ),
            );
          },
        );
      },
    );
  }
}
