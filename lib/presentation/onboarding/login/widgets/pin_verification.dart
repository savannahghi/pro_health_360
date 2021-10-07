// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/request_reset_pin_action.dart';
import 'package:myafyahub/application/redux/actions/resume_with_pin_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/logout_button.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';

class PinVerification extends StatefulWidget {
  const PinVerification({Key? key, this.payload}) : super(key: key);
  final Map<String, dynamic>? payload;

  @override
  _PinVerificationState createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  final TextEditingController pinController = TextEditingController();

  final String flag = 'resume_with_pin';
  bool launched = false;

  String? pin;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    /// clear any active flags
    clearAllFlags(context);
  }

  @override
  void didChangeDependencies() {
    if (!launched) {
      StoreProvider.dispatch(
        context,
        UpdatePinStatusAction(
          invalidPin: false,
        ),
      );
      launched = true;
    }
    super.didChangeDependencies();
  }

  Future<void> resetPinFunction(BuildContext context) async {
    // dispatch action to show user forgot PIN and wants to request a reset
    StoreProvider.dispatch<AppState>(
        context, UpdatePinStatusAction(forgotPIN: true));
    // dispatch action to send OTP to the user
    await StoreProvider.dispatch<AppState>(
        context, RequestResetPinAction(context: context, flag: flag));
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingStrings onboardingStrings = OnboardingStrings.of(context)!;
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SILFormTextField(
                key: pinInputKey,
                borderColor: Colors.grey.withOpacity(0.5),
                maxLength: 4,
                controller: pinController,
                maxLines: 1,
                keyboardType: TextInputType.number,
                obscureText: true,
                hintText: onboardingStrings.enterPinText(),
                labelText: onboardingStrings.enterPinText(),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: userPinValidator,
                onChanged: (dynamic val) {
                  pin = val.toString();
                },
              ),
              if (vm.appState.miscState!.userPin!.invalidPin) ...<Widget>[
                mediumVerticalSizedBox,
                ErrorAlertBox(message: onboardingStrings.wrongPinEntered())
              ],
              if (vm.appState.wait!.isWaitingFor(flag)) ...<Widget>[
                largeVerticalSizedBox,
                const Center(child: SILPlatformLoader())
              ],
              if (!vm.appState.wait!.isWaitingFor(flag))
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 52,
                  child: SILPrimaryButton(
                    buttonKey: phoneLoginSubmitButtonKey,
                    customRadius: 6,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        StoreProvider.dispatch(
                          context,
                          UpdatePinStatusAction(
                            pin: pin.toString(),
                            invalidPin: false,
                            controller: pinController,
                          ),
                        );
                        await StoreProvider.dispatch<AppState>(
                          context,
                          ResumeWithPinAction(
                            context: context,
                            flag: flag,
                            controller: pinController,
                          ),
                        );
                      }
                    },
                    buttonColor: Theme.of(context).primaryColor,
                    borderColor: Colors.transparent,
                    text: 'Continue',
                  ),
                ),
              Center(child: largeVerticalSizedBox),
              // check if the user is changing pin using state
              if (vm.appState.wait!.isWaitingFor(flag) == false &&
                  !vm.appState.miscState!.userPin!.isChangingPin)
                Center(
                  child: GestureDetector(
                    key: pinResetKey,
                    onTap: () => resetPinFunction(context),
                    child: Text(
                      onboardingStrings.forgotPINText(),
                      style: TextThemes.boldSize15Text(Colors.blue),
                    ),
                  ),
                ),
              if (!vm.appState.miscState!.userPin!.isChangingPin) ...<Widget>[
                largeVerticalSizedBox,
                const LogoutButton()
              ],
              if (vm.appState.miscState!.userPin!.isChangingPin) ...<Widget>[
                largeVerticalSizedBox,
                SILNoBorderButton(
                  buttonKey: searchBackButtonKey,
                  onPressed: () => Navigator.of(context).pop(),
                  text: 'Back',
                  textColor: Colors.grey,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
