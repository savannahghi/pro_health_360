// Flutter imports:
// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/send_otp_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/verify_otp_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/verify_phone_view_model.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/pin_input_field_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/src/animated_count.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOtpWidget extends StatefulWidget {
  const VerifyOtpWidget({
    Key? key,
    required this.loader,
    required this.verifyPhoneViewModel,
  }) : super(key: key);

  final Widget loader;
  final VerifyPhoneViewModel verifyPhoneViewModel;

  @override
  VerifyOtpWidgetState createState() => VerifyOtpWidgetState();
}

class VerifyOtpWidgetState extends State<VerifyOtpWidget>
    with SingleTickerProviderStateMixin, CodeAutoFill {
  Animation<double>? animation;
  bool canResend = false;
  // BehaviorSubject<bool> canResendOtp = BehaviorSubject<bool>.seeded(false);
  bool canResendOtp = false;
  String testCode = '1234';
  int resendTimeout = 60;
  TextEditingController textEditingController = TextEditingController();

  late AnimationController _controller;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return verifyOTPState;
  }

  @override
  void codeUpdated() {
    setState(() {
      // update the controller with the detected code
      textEditingController.text = code ?? testCode;
    });
  }

  @override
  void didChangeDependencies() {
    canResendOtp = widget.verifyPhoneViewModel.canResendOTP!;

    setState(() {
      canResend = canResendOtp;
    });

    // canResendOtp.listen((bool value) {
    //   setState(() {
    //     canResend = value;
    //   });
    // });
    super.didChangeDependencies();
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
          StoreProvider.dispatch<AppState>(
            context,
            UpdateOnboardingStateAction(
              canResendOTP: true,
            ),
          );
          // canResendOtp.add(true);
        }
        setState(() {
          resendTimeout = int.parse(animation!.value.toStringAsFixed(0));
        });
      });
    _controller.forward();
    super.initState();
  }

  void restartTimer() {
    resendTimeout = 90;
    _controller.value = 0;
    _controller.forward();
    // canResendOtp.add(false);
    StoreProvider.dispatch<AppState>(
      context,
      UpdateOnboardingStateAction(
        canResendOTP: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String phoneNo = widget.verifyPhoneViewModel.phoneNumber!;
    return Column(
      children: <Widget>[
        smallVerticalSizedBox,
        PINInputField(
          maxLength: 6,
          onDone: (String enteredCode) async {
            if (enteredCode == widget.verifyPhoneViewModel.otp) {
              StoreProvider.dispatch<AppState>(
                context,
                VerifyOTPAction(
                  otp: enteredCode,
                  context: context,
                ),
              );
              return;
            } else {
              showFeedbackBottomSheet(
                context: context,
                modalContent: invalidCode,
                imageAssetPath: errorIconUrl,
              );
            }
          },
        ),
        largeVerticalSizedBox,
        if (!canResend && !widget.verifyPhoneViewModel.failedToSendOTP!)
          Column(
            children: <Widget>[
              Text(
                anOtpHasBeenSentText(phoneNo),
                style: TextThemes.normalSize14Text(AppColors.secondaryColor),
              ),
              smallVerticalSizedBox,
              AnimatedCount(
                count: resendTimeout,
                duration: Duration.zero,
              ),
            ],
          ),

        ///Column should not be rendered in case of an error while sending the OTP
        if (canResend && !widget.verifyPhoneViewModel.failedToSendOTP!)
          Column(
            children: <Widget>[
              Text(
                didNotReceiveOTP,
                style: TextThemes.normalSize14Text(AppColors.secondaryColor),
              ),
              verySmallVerticalSizedBox,
              if (!widget.verifyPhoneViewModel.wait!
                  .isWaitingFor(resendOTPFlag))
                MyAfyaHubPrimaryButton(
                  buttonKey: resendOtpButtonKey,
                  customRadius: 4,
                  text: resendOTP,
                  textColor: AppColors.whiteColor,
                  buttonColor: AppColors.secondaryColor,
                  borderColor: AppColors.secondaryColor,
                  onPressed: () async {
                    StoreProvider.dispatch<AppState>(
                      context,
                      SendOTPAction(
                        context: context,
                        isResend: true,
                        callBackFunction: restartTimer,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackbar(content: const Text('hub')));
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
