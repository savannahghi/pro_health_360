// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/send_otp_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/verify_phone_view_model.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_card_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/widgets/verify_otp_widget.dart';

class VerifyPhonePage extends StatefulWidget {
  @override
  VerifyPhonePageState createState() => VerifyPhonePageState();
}

class VerifyPhonePageState extends State<VerifyPhonePage> {
  final TextEditingController otpEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch<AppState>(
        context,
        SendOTPAction(context: context),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VerifyPhoneViewModel>(
      converter: (Store<AppState> store) {
        return VerifyPhoneViewModel.fromStore(store);
      },
      builder: (BuildContext context, VerifyPhoneViewModel vm) {
        return OnboardingScaffold(
          title: verifyPhoneNumberTitle,
          description: verifyPhoneNumberDescription,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              smallVerticalSizedBox,
              Text(
                enterOTPString,
                style: TextThemes.boldSize16Text(AppColors.secondaryColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      if (vm.wait!.isWaitingFor(sendOTPFlag))
                        const SILPlatformLoader(),
                      if (vm.wait!.isWaitingFor(verifyOTP)) ...<Widget>[
                        const SILPlatformLoader(),
                        smallVerticalSizedBox,
                        Text(
                          verifyCode,
                          style: TextThemes.normalSize16Text(
                            AppColors.secondaryColor,
                          ),
                        ),
                      ],
                      if (!vm.wait!.isWaitingFor(sendOTPFlag) &&
                          !vm.wait!.isWaitingFor(verifyOTP))
                        VerifyOtpWidget(
                          verifyPhoneViewModel: vm,
                          loader: const SILPlatformLoader(),
                        ),
                    ],
                  ),
                ),
              ),

              //Incase there was an error sending the otp
              if (vm.failedToSendOTP!) ...<Widget>[
                //Handle error incase otp is not sent
                ErrorCardWidget(
                  ///Button is disable while sendOTP action is loading
                  buttonColor: vm.wait!.isWaitingFor(sendOTPFlag)
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                  callBackFunction: vm.wait!.isWaitingFor(sendOTPFlag)
                      ? null
                      : () async {
                          StoreProvider.dispatch<AppState>(
                            context,
                            SendOTPAction(
                              context: context,
                            ),
                          );
                        },
                )
              ]
            ],
          ),
        );
      },
    );
  }
}