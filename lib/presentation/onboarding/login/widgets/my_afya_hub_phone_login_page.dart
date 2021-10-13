// Flutter imports:
import 'package:async_redux/async_redux.dart';
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
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/my_afya_hub_phone_input_field.dart';
import 'package:afya_moja_core/buttons.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:myafyahub/presentation/onboarding/widgets/my_afya_hub_onboarding_scaffold.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

/// [MyAfyaHubPhoneLoginPage] is parsed in [PhoneNumberLoginPage]
///
/// It consists of [MyAfyaHubPhoneInput] used to user input PhoneNumber,
///  [CustomTextField] to input PIN and [MyAfyaHubPrimaryButton] as submit button
class MyAfyaHubPhoneLoginPage extends StatefulWidget {
  @override
  _MyAfyaHubPhoneLoginPageState createState() =>
      _MyAfyaHubPhoneLoginPageState();
}

class _MyAfyaHubPhoneLoginPageState extends State<MyAfyaHubPhoneLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController phoneNumberInputController =
      TextEditingController();

  TextEditingController pinController = TextEditingController();
  String? phoneNumber;
  String? pin;

  @override
  void initState() {
    super.initState();
    MyAfyaHubFacebookEvents().logger.logEvent(name: 'view_login_page');

    /// clear any active flags
    clearAllFlags(context);
  }

  @override
  void dispose() {
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
    return MyAfyaHubOnboardingScaffold(
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
                  logInColumn(vm),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, BWRoutes.verifySignUpOTP,
                          arguments: <String, int>{
                            'OTP': 1234,
                          });
                    },
                    child: const Text(
                      ' ',
                      key: verifyOTPGestureKey,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: MyAfyaHubPrimaryButton(
                        buttonKey: phoneLoginContinueButtonKey,
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

  Widget logInColumn(AppStateViewModel vm) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            phoneNumberString,
            style: TextThemes.boldSize14Text(AppColors.greyTextColor),
          ),
        ),
        verySmallVerticalSizedBox,
        MyAfyaHubPhoneInput(
          phoneNumberFormatter: formatPhoneNumber,
          inputController: phoneNumberInputController,
          labelText: enterPhoneNumberString,
          onChanged: (String? val) {
            if (vm.appState.miscState!.phoneSignUp!.invalidCredentials) {
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
        largeVerticalSizedBox,
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            pinString,
            style: TextThemes.boldSize14Text(AppColors.greyTextColor),
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
          labelText: enterYourString,
          validator: userPinValidator,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (String val) {
            if (vm.appState.miscState!.phoneSignUp!.invalidCredentials) {
              StoreProvider.dispatch(
                context,
                PhoneLoginStateAction(),
              );
            }
            setState(() {
              pin = val.toString();
            });
          },
        ),
        if (vm.appState.miscState?.phoneSignUp?.invalidCredentials ??
            false) ...<Widget>[
          const ErrorAlertBox(message: invalidCredentialsErrorMsg),
        ],
        if (vm.appState.wait!.isWaitingFor(phoneLoginFlag)) ...<Widget>[
          const Center(
            child: SILPlatformLoader(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ],
    );
  }
}
