// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';

import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/view_models/verify_phone_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/onboarding/login/widgets/error_card_widget.dart';
import 'package:pro_health_360/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';

class VerifyPhoneWidget extends StatefulWidget {
  const VerifyPhoneWidget({
    required this.sendOTPFunction,
    required this.canResendOTPFunction,
    required this.cantResendOTPFunction,
    required this.onDone,
    required this.resendOTPFunction,
    required this.vm,
  });

  final VoidCallback canResendOTPFunction;
  final VoidCallback cantResendOTPFunction;
  final void Function(String) onDone;
  final VoidCallback resendOTPFunction;
  final VoidCallback sendOTPFunction;
  final VerifyPhoneViewModel vm;

  @override
  VerifyPhoneWidgetState createState() => VerifyPhoneWidgetState();
}

class VerifyPhoneWidgetState extends State<VerifyPhoneWidget> {
  final TextEditingController otpEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      widget.sendOTPFunction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: verifyPhoneNumberTitle,
      description: verifyPhoneNumberDescription,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          smallVerticalSizedBox,
          Text(
            enterOTPString,
            style: boldSize16Text(AppColors.secondaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                children: <Widget>[
                  if (widget.vm.wait!.isWaitingFor(sendOTPFlag))
                    const PlatformLoader(),
                  if (widget.vm.wait!.isWaitingFor(verifyOTPFlag)) ...<Widget>[
                    const PlatformLoader(),
                    smallVerticalSizedBox,
                    Text(
                      verifyCode,
                      style: normalSize16Text(AppColors.secondaryColor),
                    ),
                  ],
                  if (!widget.vm.wait!.isWaitingFor(sendOTPFlag) &&
                      !widget.vm.wait!.isWaitingFor(verifyOTPFlag))
                    VerifyOtpWidget(
                      vm: widget.vm,
                      loader: const PlatformLoader(),
                      canResendOTPFunction: widget.canResendOTPFunction,
                      cantResendOTPFunction: widget.cantResendOTPFunction,
                      onDone: widget.onDone,
                      resendOTPFunction: widget.resendOTPFunction,
                    ),
                ],
              ),
            ),
          ),

          //Incase there was an error sending the otp
          if (widget.vm.failedToSendOTP!) ...<Widget>[
            // Handle error incase otp is not sent
            ErrorCardWidget(
              ///Button is disable while sendOTP action is loading
              buttonColor: widget.vm.wait!.isWaitingFor(sendOTPFlag)
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
              callBackFunction: widget.vm.wait!.isWaitingFor(sendOTPFlag)
                  ? null
                  : () async {
                      widget.sendOTPFunction();
                    },
            )
          ]
        ],
      ),
    );
  }
}
