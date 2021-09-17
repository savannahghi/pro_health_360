import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/dynamic_back_route_holder.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/onboarding_page_wrapper.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:myafyahub/application/core/services/signup_utils.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/onboarding/signup/pin_input_wrapper.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

class CreatePinPage extends StatefulWidget {
  final bool changingPin;

  const CreatePinPage({Key? key, this.changingPin = false}) : super(key: key);
  @override
  _CreatePinPageState createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  @override
  void initState() {
    super.initState();
    BeWellFacebookEvents().logger.logEvent(name: 'view_set_pin_page');

    /// clear any active flags
    clearAllFlags(context);
  }

  final TextEditingController createPinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? createPin;
  String? confirmPin;

  bool doesNotMatch() {
    if (createPin == null && confirmPin == null) return false;
    if (createPin != null && confirmPin == null) return false;
    return createPin != null && confirmPin != null && createPin != confirmPin;
  }

  @override
  Widget build(BuildContext context) {
    final SignUpUtils signUpUtils = SignUpUtils();
    final OnboardingStrings onBoardingStrings = OnboardingStrings.of(context)!;
    final bool isChangingPin = widget.changingPin;

    return Scaffold(
      body: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    preferredPaddingOnStretchedScreens(context: context)),
            child: OnboardingPageWrapper(
              title: isChangingPin
                  ? onBoardingStrings.changePinText()
                  : onBoardingStrings.createPinText(),
              description: isChangingPin
                  ? onBoardingStrings.changePinToSecureAccountText()
                  : onBoardingStrings.secureAccountText(),
              svgPath: shieldIconImgUrl,
              previousRoute: DynamicBackRouteHolder().createPINPage.valueOrNull,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    PinInputWrapper(
                        pinController: createPinController,
                        pinInputKey: enterPinKey,
                        hintText: onBoardingStrings.enterPinText(),
                        labelText: onBoardingStrings.enterPinText(),
                        onChanged: (dynamic value) {
                          setState(() {
                            createPin = value.toString();
                          });
                        }),
                    mediumVerticalSizedBox,
                    PinInputWrapper(
                        pinController: confirmPinController,
                        pinInputKey: confirmPinKey,
                        hintText: onBoardingStrings.confirmPinText(),
                        labelText: onBoardingStrings.confirmPinText(),
                        onChanged: (dynamic value) {
                          setState(() {
                            confirmPin = value.toString();
                          });
                        }),
                    largeVerticalSizedBox,
                    if (vm.appState.miscState!.phoneSignUp!
                            .invalidCredentials ||
                        doesNotMatch()) ...<Widget>[
                      mediumVerticalSizedBox,
                      const ErrorAlertBox(message: unMatchingPinErrorText),
                      size15VerticalSizedBox,
                    ],
                    if (vm.appState.wait!
                        .isWaitingFor(createPinFlag)) ...<Widget>[
                      const Center(
                        child: SILPlatformLoader(),
                      ),
                    ],
                    if (!vm.appState.wait!.isWaitingFor(createPinFlag))
                      SizedBox(
                        width: 356,
                        height: 52,
                        child: SILPrimaryButton(
                          buttonKey: continueKey,
                          onPressed: () async {
                            if (doesNotMatch()) {
                              return;
                            }
                            await signUpUtils.signUpUser(
                                context: context,
                                validateFormFields:
                                    _formKey.currentState!.validate(),
                                createPin: createPinController.text,
                                confirmPin: confirmPinController.text);
                          },
                          buttonColor: doesNotMatch()
                              ? Colors.grey[300]
                              : Theme.of(context).primaryColor,
                          borderColor: Colors.transparent,
                          text: onBoardingStrings.continueText(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
