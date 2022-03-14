// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
// Project imports:

import 'package:myafyahub/application/redux/view_models/verify_phone_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/animated_count.dart';
import 'package:shared_themes/spaces.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOtpWidget extends StatefulWidget {
  const VerifyOtpWidget({
    required this.loader,
    this.canResendOTPFunction,
    required this.cantResendOTPFunction,
    required this.onDone,
    required this.resendOTPFunction,
    required this.vm,
  });

  final VoidCallback? canResendOTPFunction;
  final VoidCallback cantResendOTPFunction;
  final Widget loader;
  final void Function(String) onDone;
  final VoidCallback resendOTPFunction;
  final VerifyPhoneViewModel vm;

  @override
  VerifyOtpWidgetState createState() => VerifyOtpWidgetState();
}

class VerifyOtpWidgetState extends State<VerifyOtpWidget>
    with SingleTickerProviderStateMixin, CodeAutoFill {
  Animation<double>? animation;
  int resendTimeout = 60;
  String testCode = '1234';
  TextEditingController textEditingController = TextEditingController();

  late AnimationController _controller;

  @override
  void codeUpdated() {
    setState(() {
      // update the controller with the detected code
      textEditingController.text = code ?? testCode;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // listen for otp code sent via sms
    listenForCode();
    _controller =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    animation = Tween<double>(begin: resendTimeout.toDouble(), end: 0)
        .animate(_controller)
      ..addListener(() {
        if (resendTimeout == 0) {
          widget.canResendOTPFunction?.call();
        }
        setState(() {
          resendTimeout = int.parse(animation!.value.toStringAsFixed(0));
        });
      });
    _controller.forward();
    super.initState();
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return verifyOTPState;
  }

  void restartTimer() {
    resendTimeout = 90;
    _controller.value = 0;
    _controller.forward();
    widget.cantResendOTPFunction.call();
  }

  @override
  Widget build(BuildContext context) {
    final bool canResend = widget.vm.canResendOTP!;
    return Column(
      children: <Widget>[
        smallVerticalSizedBox,
        PINInputField(
          maxLength: 6,
          controller: textEditingController,
          onDone: (String enteredCode) async {
            widget.onDone(enteredCode);
            textEditingController.clear();
          },
        ),
        largeVerticalSizedBox,
        if (!canResend && !widget.vm.failedToSendOTP!)
          Column(
            children: <Widget>[
              Text(
                anOtpHasBeenSentText(widget.vm.phoneNumber ?? ''),
                style: normalSize14Text(AppColors.secondaryColor),
              ),
              smallVerticalSizedBox,
              AnimatedCount(count: resendTimeout, duration: Duration.zero),
            ],
          ),

        ///Column should not be rendered in case of an error while sending the OTP
        if (canResend && !widget.vm.failedToSendOTP!)
          Column(
            children: <Widget>[
              Text(
                didNotReceiveOTP,
                style: normalSize14Text(AppColors.secondaryColor),
              ),
              verySmallVerticalSizedBox,
              if (!widget.vm.wait!.isWaitingFor(resendOTPFlag))
                MyAfyaHubPrimaryButton(
                  buttonKey: resendOtpButtonKey,
                  customRadius: 4,
                  text: resendOTP,
                  textColor: AppColors.whiteColor,
                  buttonColor: AppColors.secondaryColor,
                  borderColor: AppColors.secondaryColor,
                  onPressed: () async {
                    widget.resendOTPFunction.call();
                    restartTimer();
                    await Future<dynamic>.delayed(const Duration(seconds: 3));
                    textEditingController.clear();
                  },
                )
              else ...<Widget>[
                smallVerticalSizedBox,
                widget.loader,
              ]
            ],
          ),
      ],
    );
  }
}
