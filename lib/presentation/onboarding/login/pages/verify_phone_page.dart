// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/send_otp_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/application/redux/view_models/verify_phone_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/dynamic_back_route_holder.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/verify_otp_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';

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
        final String userID = vm.userID ?? UNKNOWN;
        final String phoneNumber = vm.phoneNumber ?? UNKNOWN;
        final String otp = vm.otp ?? UNKNOWN;

        return OnboardingScaffold(
          title: verifyPhoneNumberTitle,
          description: verifyPhoneNumberDescription,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                enterOTPString,
                style: TextThemes.boldSize16Text(AppColors.secondaryColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      if (vm.wait!.isWaitingFor(sendOTPFlag))
                        const SILPlatformLoader(),
                      if (!vm.wait!.isWaitingFor(sendOTPFlag))
                        VerifyOtpWidget(
                          phoneNo: phoneNumber,
                          userID: userID,
                          otp: otp,
                          loader: const SILPlatformLoader(),
                          client: AppWrapperBase.of(context)!.graphQLClient,
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

                            StoreProvider.dispatch(
                              context,
                              UpdateOnboardingStateAction(
                                isPhoneVerified: true,
                              ),
                            );

                            final ClientState? clientState =
                                StoreProvider.state<AppState>(context)
                                    ?.clientState;
                            final OnboardingState? onboardingState =
                                StoreProvider.state<AppState>(context)
                                    ?.onboardingState;

                            // navigate to create new Terms and Conditions
                            await Navigator.pushReplacementNamed(
                              context,
                              onboardingPath(
                                clientState: clientState,
                                onboardingState: onboardingState,
                              ).route,
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
