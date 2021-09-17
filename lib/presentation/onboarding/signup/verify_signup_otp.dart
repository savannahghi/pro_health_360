import 'package:myafyahub/application/redux/states/app_state.dart';

import 'package:myafyahub/application/redux/view_models/phone_signup_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/dynamic_back_route_holder.dart';
import 'package:myafyahub/domain/core/entities/login/phone_signup.dart';

import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/signup/create_pin_page.dart';

import 'package:myafyahub/presentation/router/routes.dart';
import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_utils.dart';

import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:shared_ui_components/verify_phone_otp.dart';

class VerifySignUpOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingStrings onboardingStrings = OnboardingStrings.of(context)!;
    return Scaffold(
      body: StoreConnector<AppState, PhoneSignUpViewModel>(
        converter: (Store<AppState> store) =>
            PhoneSignUpViewModel.fromStore(store),
        builder: (BuildContext context, PhoneSignUpViewModel vm) {
          final PhoneSignUp? phoneSignUpState = vm.phoneSignUpState;
          final String phoneNumber = phoneSignUpState!.phoneNumber!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(
              children: <Widget>[
                size100VerticalSizedBox,
                Center(
                    child: SvgPicture.asset(shieldIconImgUrl,
                        width: 80, height: 80)),
                mediumVerticalSizedBox,
                Align(
                  child: Text(
                    onboardingStrings.verifyPhoneNumberText(),
                    style: TextThemes.boldSize20Text(
                        Theme.of(context).accentColor),
                  ),
                ),
                mediumVerticalSizedBox,
                Align(
                  child: Text(
                    '${onboardingStrings.codeSentText()}${' $phoneNumber'}',
                    style: TextThemes.boldSize15Text(),
                    textAlign: TextAlign.center,
                  ),
                ),
                mediumVerticalSizedBox,
                VerifyPhoneOtp(
                  phoneNo: phoneSignUpState.phoneNumber.toString(),
                  otp: phoneSignUpState.otp.toString(),
                  generateOtpFunc: GraphQlUtils().generateRetryOtp,
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  retrySendOtpEndpoint: (List<AppContext> contexts) {
                    return AppWrapperBase.of(context)!
                        .customContext
                        ?.retryResendOtpEndpoint;
                  },
                  appWrapperContext: AppWrapperBase.of(context)!.appContexts,
                  loader: const SILPlatformLoader(),
                  changeNumberCallback: () => Navigator.of(context)
                      .pushReplacementNamed(BWRoutes.phoneLogin),
                  successCallBack: (
                      {required String otp,
                      required Function toggleLoading}) async {
                    DynamicBackRouteHolder()
                        .createPINPage
                        .add(BWRoutes.phoneLogin);
                    // navigate the user to the set pin page and avoid user from navigating back to this page
                    await Navigator.of(context).pushReplacement(
                        MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                const CreatePinPage()));
                  },
                ),
                largeVerticalSizedBox,
                SILNoBorderButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(BWRoutes.phoneLogin),
                  text: onboardingStrings.backText(),
                  textColor: AppColors.greyColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
