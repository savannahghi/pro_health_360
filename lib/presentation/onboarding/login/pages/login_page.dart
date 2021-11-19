// Flutter imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:afya_moja_core/phone_input.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/services/login_utils.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

/// [LoginPage] is parsed in [PhoneNumberLoginPage]
///
/// It consists of [MyAfyaHubPhoneInput] used to user input PhoneNumber,
///  [CustomTextField] to input PIN and [MyAfyaHubPrimaryButton] as submit button
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? phoneNumber;
  String? pin;

  final TextEditingController phoneNumberInputController =
      TextEditingController();
  TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    if (phoneNumber == null) {
      /// reset login state upon entering this page
      StoreProvider.dispatch(context, PhoneLoginStateAction());
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    pinController.dispose();
    phoneNumberInputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    MyAfyaHubFacebookEvents().logger.logEvent(name: 'view_login_page');

    /// clear any active flags
    clearAllFlags(context);
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: loginPageTitleString,
      description: loginPageSubTitleString,
      child: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.6,
            child: Form(
              key: _formKey,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          phoneNumberString,
                          style: TextThemes.boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      MyAfyaHubPhoneInput(
                        phoneNumberFormatter: formatPhoneNumber,
                        inputController: phoneNumberInputController,
                        labelText: enterPhoneNumberString,
                        onChanged: (String? val) {
                          if (vm.appState.onboardingState!.phoneLogin!
                              .invalidCredentials) {
                            StoreProvider.dispatch(
                              context,
                              PhoneLoginStateAction(),
                            );
                          }

                          setState(() {
                            phoneNumber = val;
                          });
                        },
                      ),
                      largeVerticalSizedBox,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          pinString,
                          style: TextThemes.boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      CustomTextField(
                        formFieldKey: pinInputKey,
                        borderColor: Colors.grey[200],
                        maxLength: 4,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        hintText: enterYourString,
                        validator: userPinValidator,
                        autovalidateMode: AutovalidateMode.disabled,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String val) {
                          if (vm.appState.onboardingState!.phoneLogin!
                              .invalidCredentials) {
                            StoreProvider.dispatch(
                              context,
                              PhoneLoginStateAction(),
                            );
                          }
                          setState(() {
                            pin = val;
                          });
                        },
                      ),
                      if (vm.appState.onboardingState?.phoneLogin
                              ?.invalidCredentials ??
                          false) ...<Widget>[
                        const ErrorAlertBox(
                          message: invalidCredentialsErrorMsg,
                        ),
                      ],
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: (vm.appState.wait!.isWaitingFor(phoneLoginFlag))
                        ? const SILPlatformLoader()
                        : SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: MyAfyaHubPrimaryButton(
                              buttonKey: phoneLoginContinueButtonKey,
                              onPressed: () async {
                                final bool? isConnected =
                                    vm.appState.connectivityState?.isConnected;

                                if (isConnected != null && !isConnected) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(noInternetConnection),
                                    ),
                                  );
                                  return;
                                }

                                if (pin != null &&
                                    phoneNumber != null &&
                                    pin != UNKNOWN &&
                                    phoneNumber != UNKNOWN) {
                                  await signInUser(
                                    context: context,
                                    pin: pin!,
                                    phoneNumber: phoneNumber!,
                                  );
                                }
                              },
                              buttonColor: AppColors.secondaryColor,
                              borderColor: Colors.transparent,
                              text: continueString,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
