// Flutter imports:
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/dynamic_back_route_holder.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:shared_ui_components/verify_phone_otp.dart';

class ForgotPinOtpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingStrings onboardingStrings = OnboardingStrings.of(context)!;
    const String flag = 'forgot_pin_otp_widget';

    return Scaffold(
      body: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          final String? phoneNumber =
              vm.appState.clientState!.user?.primaryContact!.contact;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  size100VerticalSizedBox,
                  Center(
                    child: SvgPicture.asset(
                      shieldIconImgUrl,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  mediumVerticalSizedBox,
                  Align(
                    child: Text(
                      onboardingStrings.verifyPhoneNumberText(),
                      style: TextThemes.boldSize20Text(
                        Theme.of(context).colorScheme.secondary,
                      ),
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
                  Center(
                    child: VerifyPhoneOtp(
                      phoneNo: phoneNumber!,
                      otp: vm.appState.miscState!.userPin!.recoveryOtp!,
                      loader: const SILPlatformLoader(),
                      generateOtpFunc: GraphQlUtils().generateRetryOtp,
                      client: AppWrapperBase.of(context)?.graphQLClient,
                      retrySendOtpEndpoint: (List<AppContext> contexts) {
                        return AppWrapperBase.of(context)!
                            .customContext
                            ?.retryResendOtpEndpoint;
                      },
                      appWrapperContext:
                          EndPointsContextSubject().contexts.valueOrNull,
                      successCallBack: ({
                        required String otp,
                        required Function toggleLoading,
                      }) async {
                        // set back route
                        DynamicBackRouteHolder()
                            .createPINPage
                            .add(BWRoutes.phoneLogin);
                        // navigate to create new PIN page
                        await Navigator.pushReplacementNamed(
                          context,
                          BWRoutes.createPin,
                        );
                      },
                    ),
                  ),
                  largeVerticalSizedBox,
                  SILNoBorderButton(
                    buttonKey: searchBackButtonKey,
                    onPressed: () => Navigator.of(context).pop(),
                    text: onboardingStrings.backText(),
                    textColor: AppColors.greyColor,
                  ),
                  if (vm.appState.miscState!.userPin!.invalidPin) ...<Widget>[
                    mediumVerticalSizedBox,
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ErrorAlertBox(message: enteredWrongPINString),
                    )
                  ],
                  if (vm.appState.wait!.isWaitingFor(flag) == true) ...<Widget>[
                    largeVerticalSizedBox,
                    const Center(child: SILPlatformLoader())
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
