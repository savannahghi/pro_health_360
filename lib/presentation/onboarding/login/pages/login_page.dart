import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graphql_client/src/i_flutter_graphql_client.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/check_and_update_connectivity_action.dart';
import 'package:myafyahub/application/redux/actions/onboarding/phone_login_action.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_interface.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_provider.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:shared_themes/spaces.dart';

/// [LoginPage] is parsed in [PhoneNumberLoginPage]
///
/// It consists of [MyAfyaHubPhoneInput] used to user input PhoneNumber,
///  [CustomTextField] to input PIN and [MyAfyaHubPrimaryButton] as submit button
class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? phoneNumber;
  final TextEditingController phoneNumberInputController =
      TextEditingController();

  String? pin;
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
                      largeVerticalSizedBox,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          phoneNumberString,
                          style: boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      smallVerticalSizedBox,
                      MyAfyaHubPhoneInput(
                        textFormFieldKey: textFormFieldKey,
                        phoneNumberFormatter: formatPhoneNumber,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          filled: true,
                          fillColor: AppColors.lightGreyBackgroundColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]!),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        onChanged: (String? val) {
                          final bool? invalidCredentials = vm.appState
                              .onboardingState?.phoneLogin?.invalidCredentials;

                          if (invalidCredentials != null &&
                              invalidCredentials) {
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
                      mediumVerticalSizedBox,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          pinString,
                          style: boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      smallVerticalSizedBox,
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
                          final bool? invalidCredentials = vm.appState
                              .onboardingState?.phoneLogin?.invalidCredentials;

                          if (invalidCredentials != null &&
                              invalidCredentials) {
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
                        ? const PlatformLoader()
                        : SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: MyAfyaHubPrimaryButton(
                              buttonKey: phoneLoginContinueButtonKey,
                              onPressed: () async {
                                final ConnectivityChecker connectivityChecker =
                                    ConnectivityCheckerProvider.of(context)
                                        .connectivityChecker;

                                StoreProvider.dispatch(
                                  context,
                                  CheckAndUpdateConnectivityAction(
                                    connectivityChecker: connectivityChecker,
                                  ),
                                );

                                final bool? isFormValid =
                                    _formKey.currentState?.validate();

                                if (isFormValid != null &&
                                    isFormValid &&
                                    pin != null &&
                                    phoneNumber != null &&
                                    pin != UNKNOWN &&
                                    phoneNumber != UNKNOWN) {
                                  signInUser(
                                    pin: pin!,
                                    phoneNumber: phoneNumber!,
                                  );
                                }
                              },
                              buttonColor: AppColors.primaryColor,
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

  void signInUser({
    required String pin,
    required String phoneNumber,
  }) {
    // this is the Redux Action that store the phone number and PIN user enters
    StoreProvider.dispatch(
      context,
      PhoneLoginStateAction(phoneNumber: phoneNumber, pinCode: pin),
    );

    final IGraphQlClient httpClient = AppWrapperBase.of(context)!.graphQLClient;
    final String loginEndpoint =
        AppWrapperBase.of(context)!.customContext!.loginByPhoneEndpoint;

    final bool hasConnection = StoreProvider.state<AppState>(context)
            ?.connectivityState
            ?.isConnected ??
        false;

    if (hasConnection) {
      StoreProvider.dispatch<AppState>(
        context,
        PhoneLoginAction(
          httpClient: httpClient,
          loginEndpoint: loginEndpoint,
          errorCallback: (String reason) {
            showFeedbackBottomSheet(
              context: context,
              modalContent: reason,
              imageAssetPath: errorIconUrl,
            );
          },
        ),
      );
    } else {
      const SnackBar snackbar = SnackBar(content: Text(checkInternetText));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
