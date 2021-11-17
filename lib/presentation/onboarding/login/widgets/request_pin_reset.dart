// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/request_reset_pin_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/request_pin_reset_behavior_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/number_constants.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/widgets/bewell_scaffold.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class RequestPinReset extends StatefulWidget {
  @override
  _RequestPinResetState createState() => _RequestPinResetState();
}

class _RequestPinResetState extends State<RequestPinReset> {
  final TextEditingController phoneNumberInputController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? phoneNumber;

  @override
  void initState() {
    super.initState();

    /// clear any active flags
    clearAllFlags(context);
  }

  @override
  void dispose() {
    phoneNumberInputController.dispose();
    super.dispose();
  }

  Future<void> requestPinResetFunction({
    required GlobalKey<FormState> formKey,
    required String phoneNumber,
    required String flag,
  }) async {
    if (formKey.currentState!.validate()) {
      StoreProvider.dispatch(
        context,
        UpdateClientProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(phoneNumber),
          ),
        ),
      );
      // dispatch action to show user forgot PIN and wants to request a reset
      StoreProvider.dispatch<AppState>(
        context,
        UpdatePinStatusAction(forgotPIN: true),
      );
      // dispatch action to send OTP to the user
      await StoreProvider.dispatch<AppState>(
        context,
        RequestResetPinAction(context: context, flag: flag),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const String flag = requestResetPinText;
    final RequestPinResetBehaviorObject requestPinResetBehaviorObject =
        RequestPinResetBehaviorObject();

    final OnboardingStrings onboardingStrings = OnboardingStrings.of(context)!;

    return BeWellScaffold(
      gradient: defaultGradient(Theme.of(context).primaryColor),
      child: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: preferredPaddingOnStretchedScreens(context: context),
            ),
            key: requestPinResetWidgetKey,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  largeVerticalSizedBox,
                  largeVerticalSizedBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(onboardingStrings.phoneNumberText()),
                  ),
                  smallVerticalSizedBox,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SILPhoneInput(
                      phoneNumberFormatter: formatPhoneNumber,
                      inputController: phoneNumberInputController,
                      labelStyle: TextThemes.boldSize16Text(),
                      labelText: onboardingStrings.phoneNumberText(),
                      onChanged: (String? val) {
                        if (val != null) phoneNumber = val;
                      },
                    ),
                  ),
                  if (requestPinResetBehaviorObject
                          .userHasNoAccount.valueOrNull! ==
                      true) ...<Widget>[
                    smallVerticalSizedBox,
                    Center(
                      child: Text(
                        onboardingStrings.noAccountWithPhoneNumber(),
                        style: TextThemes.normalSize14Text(AppColors.redColor),
                      ),
                    ),
                  ],
                  largeVerticalSizedBox,
                  if (vm.appState.wait!.isWaitingFor(flag)) ...<Widget>[
                    const Center(child: SILPlatformLoader()),
                    size15VerticalSizedBox,
                  ] else
                    SizedBox(
                      width: number356,
                      height: number52,
                      child: SILPrimaryButton(
                        onPressed: () {
                          if (phoneNumber != null) {
                            requestPinResetFunction(
                              formKey: _formKey,
                              phoneNumber: phoneNumber!,
                              flag: flag,
                            );
                          }
                        },
                        buttonColor: Theme.of(context).primaryColor,
                        borderColor: Colors.transparent,
                        text: onboardingStrings.requestText(),
                        buttonKey: startLoginButtonKey,
                      ),
                    ),
                  largeVerticalSizedBox,
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: onboardingStrings.haveAnAccountText(),
                            style: TextThemes.normalSize16Text(
                              AppColors.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: onboardingStrings.loginTextV2(),
                            style: TextThemes.boldSize16Text(
                              Theme.of(context).primaryColorDark,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushNamed(
                                    context,
                                    BWRoutes.phoneLogin,
                                  ),
                          )
                        ],
                      ),
                      key: phoneLoginGesture,
                    ),
                  ),
                  largeVerticalSizedBox,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
