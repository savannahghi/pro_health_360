import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/application/core/services/login_utils.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:myafyahub/presentation/onboarding/widgets/bewell_scaffold.dart';
import 'package:myafyahub/presentation/onboarding/widgets/scaffold_header.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/application/core/services/utils.dart';

import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

class PhoneLoginPage extends StatefulWidget {
  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController phoneNumberInputController =
      TextEditingController();

  TextEditingController pinController = TextEditingController();
  String? phoneNumber;
  String? pin;
  final FocusNode pinFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    MyAfyaHubFacebookEvents().logger.logEvent(name: 'view_login_page');

    /// clear any active flags
    clearAllFlags(context);
  }

  @override
  void dispose() {
    pinFocusNode.dispose();
    pinController.dispose();
    phoneNumberInputController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (phoneNumber == null) {
      /// reset login state upon entering this page
      StoreProvider.dispatch(context, PhoneLoginStateAction());
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingStrings uiStrings = OnboardingStrings.of(context)!;
    return BeWellScaffold(
      gradient: defaultGradient(Theme.of(context).primaryColor),
      child: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      preferredPaddingOnStretchedScreens(context: context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ScaffoldHeader(
                    title: uiStrings.loginText(),
                    description: phoneNumberSignInSubtitle,
                    backFunc: () {
                      Navigator.pushReplacementNamed(context, BWRoutes.landing);
                    },
                  ),
                  largeVerticalSizedBox,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SILPhoneInput(
                      phoneNumberFormatter: formatPhoneNumber,
                      inputController: phoneNumberInputController,
                      labelStyle: TextThemes.boldSize16Text(),
                      labelText: uiStrings.phoneNumberText(),
                      onChanged: (String? val) {
                        if (vm.appState.miscState!.phoneSignUp!
                            .invalidCredentials) {
                          StoreProvider.dispatch(
                            context,
                            PhoneLoginStateAction(),
                          );
                        }
                        setState(() {
                          phoneNumber = val?.toString();
                        });
                      },
                    ),
                  ),
                  largeVerticalSizedBox,
                  CustomTextField(
                    formFieldKey: pinInputKey,
                    borderColor: Colors.grey.withOpacity(0.5),
                    maxLength: 4,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    labelText: uiStrings.enterPinText(),
                    validator: userPinValidator,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (String val) {
                      if (vm.appState.miscState!.phoneSignUp!
                          .invalidCredentials) {
                        StoreProvider.dispatch(
                          context,
                          PhoneLoginStateAction(),
                        );
                      }
                      pin = val.toString();
                    },
                  ),
                  if (vm.appState.miscState?.phoneSignUp?.invalidCredentials ??
                      false) ...<Widget>[
                    const ErrorAlertBox(message: invalidCredentialsErrorMsg),
                  ],
                  if (vm.appState.wait!
                      .isWaitingFor(phoneLoginFlag)) ...<Widget>[
                    const Center(child: SILPlatformLoader()),
                    size15VerticalSizedBox,
                  ],
                  GestureDetector(
                    key: resetPinKey,
                    onTap: () {
                      MyAfyaHubFacebookEvents()
                          .logger
                          .logEvent(name: 'view_request_pin_reset_page');
                      Navigator.pushNamed(context, BWRoutes.resetPin);
                    },
                    child: Text(
                      uiStrings.forgotPINText(),
                      style: TextThemes.boldSize15Text(Colors.blue),
                    ),
                  ),
                  largeVerticalSizedBox,
                  if (!vm.appState.wait!.isWaitingFor(phoneLoginFlag))
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: SILPrimaryButton(
                        buttonKey: phoneLoginSubmitButtonKey,
                        onPressed: () async {
                          if (!InternetConnectivitySubject()
                              .connectivitySubject
                              .valueOrNull!) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(noInternetConnection)));
                            return;
                          }
                          if (_formKey.currentState!.validate()) {
                            if (pin != null && phoneNumber != null) {
                              await signInUser(
                                context: context,
                                pin: pin!,
                                phoneNumber: phoneNumber!,
                              );
                            }
                            return;
                          }
                        },
                        buttonColor: Theme.of(context).primaryColor,
                        borderColor: Colors.transparent,
                        text: uiStrings.signInText(),
                      ),
                    ),
                  largeVerticalSizedBox,
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: doesNotHaveAccount,
                          style:
                              TextThemes.normalSize16Text(AppColors.blackColor),
                        ),
                      ],
                    ),
                    key: createNewAccountKey,
                  ),
                  mediumVerticalSizedBox,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
