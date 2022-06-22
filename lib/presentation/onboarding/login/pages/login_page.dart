import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graphql_client/src/i_flutter_graphql_client.dart';

import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/onboarding/phone_login_action.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/login_page_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/onboarding/login/widgets/phone_login_error_widget.dart';

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
  Widget build(BuildContext context) {
    final double sizedBoxHeight = MediaQuery.of(context).size.width / 8;

    // A small indicator to help us identify whether the app is running in
    // staging or testing
    final bool isAppTest =
        AppWrapperBase.of(context)!.appContexts.contains(AppContext.AppTest);

    return StoreConnector<AppState, LoginPageViewModel>(
      converter: (Store<AppState> store) =>
          LoginPageViewModel.fromState(store.state),
      onInit: (Store<AppState> store) {
        store.dispatch(WaitAction<AppState>.clear());
      },
      onDispose: (Store<AppState> store) {
        pinController.dispose();
        phoneNumberInputController.dispose();
      },
      builder: (BuildContext context, LoginPageViewModel vm) {
        final TargetPlatform _platform = Theme.of(context).platform;
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveWidget.preferredPaddingOnStretchedScreens(
                          context: context,
                        ),
                      ),
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: sizedBoxHeight),
                          const OnboardingScaffoldHeader(
                            title: loginPageTitleString,
                            description: loginPageSubTitleString,
                          ),
                          smallVerticalSizedBox,
                          largeVerticalSizedBox,
                          Align(
                            alignment: Alignment.centerLeft,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: InputBorder.none,
                              filled: true,
                              fillColor: AppColors.lightGreyBackgroundColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[200]!),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            onChanged: (String? val) {
                              final bool? invalidCredentials =
                                  vm.invalidCredentials;

                              if (invalidCredentials != null &&
                                  invalidCredentials) {
                                StoreProvider.dispatch(
                                  context,
                                  UpdateOnboardingStateAction(
                                    invalidCredentials: false,
                                    phoneNumber: val,
                                  ),
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
                              final bool? invalidCredentials =
                                  vm.invalidCredentials;

                              if (invalidCredentials != null &&
                                  invalidCredentials) {
                                StoreProvider.dispatch(
                                  context,
                                  UpdateOnboardingStateAction(
                                    invalidCredentials: false,
                                    pin: val,
                                  ),
                                );
                              }

                              setState(() {
                                pin = val;
                              });
                            },
                          ),
                          if (vm.invalidCredentials ?? false) ...<Widget>[
                            largeVerticalSizedBox,
                            PhoneLoginErrorWidget(
                              formKey: _formKey,
                              phone: phoneNumber,
                            ),
                          ],
                          size70VerticalSizedBox,
                        ],
                      ),
                    ),
                  ),
                ),
                if (_platform != TargetPlatform.iOS)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Center(
                      child: Text(
                        '$appVersionString $APPVERSION',
                        style: normalSize9Text(Colors.grey),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveWidget.preferredPaddingOnStretchedScreens(
                context: context,
              ),
              vertical: 12,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: vm.wait!.isWaitingFor(phoneLoginFlag)
                  ? const PlatformLoader()
                  : MyAfyaHubPrimaryButton(
                      buttonKey: phoneLoginContinueButtonKey,
                      onPressed: () async {
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
                      buttonColor: isAppTest
                          ? AppColors.greenHappyColor
                          : AppColors.primaryColor,
                      borderColor: Colors.transparent,
                      text: continueString,
                    ),
            ),
          ),
        );
      },
    );
  }

  void signInUser({
    required String pin,
    required String phoneNumber,
  }) {
    // this is the Redux Action that store the phone number and PIN user enters
    StoreProvider.dispatch(
      context,
      UpdateOnboardingStateAction(phoneNumber: phoneNumber, pin: pin),
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
          endpoint: loginEndpoint,
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
      AnalyticsService().logEvent(
        name: noConnectionEvent,
        eventType: AnalyticsEventType.CONNECTIVITY,
      );
    }
  }
}
