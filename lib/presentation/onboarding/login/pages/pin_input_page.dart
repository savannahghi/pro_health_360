// Project imports:
import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/bottom_nav_action.dart';
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/actions/update_pin_input_details_action.dart';
import 'package:pro_health_360/application/redux/actions/verify_pin_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/pin_input_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/infrastructure/connectivity/connectivity_interface.dart';
import 'package:pro_health_360/infrastructure/connectivity/mobile_connectivity_status.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/onboarding/login/widgets/key_pad_widget.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:shared_themes/constants.dart';

class PINInputPage extends StatefulWidget {
  /// [PINInputPage] is a widget used to input and validate user pin before accessing
  /// [MyHealth] section of the app

  PINInputPage({ConnectivityChecker? connectivityStatus})
      : connectivityStatus = connectivityStatus ?? MobileConnectivityChecker();

  final ConnectivityChecker connectivityStatus;

  final TextEditingController _pinController = TextEditingController();

  @override
  _PINInputPageState createState() => _PINInputPageState();
}

class _PINInputPageState extends State<PINInputPage> {
  bool canEnterPin = true;
  String errorMessage = '';
  TextStyle errorMessageStyle = boldSize12Text(AppColors.wrongPinTextColor);
  bool isCorrectPin = false;
  final int maxTries = 4;
  late Timer timer;
  bool timerRunning = false;

  int _start = 300;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      pinInputTimerStatus(context: context);
    });
  }

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          setState(() {
            errorMessageStyle = boldSize12Text(AppColors.wrongPinTextColor);
            errorMessage = '';
            canEnterPin = true;
            WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
              StoreProvider.dispatch(
                context,
                UpdatePINInputDetailsAction(
                  maxTryTime: '',
                  resumeTimer: false,
                  pinInputTries: 0,
                ),
              );
            });
            timerRunning = false;

            return;
          });
        } else {
          setState(() {
            _start--;
            errorMessageStyle = heavySize12Text(AppColors.redColor);
            errorMessage = tooManyTriesString(_start);
            canEnterPin = false;
            timerRunning = true;
            widget._pinController.text = '';
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    late String enteredPin = '';
    return WillPopScope(
      onWillPop: () async {
        StoreProvider.dispatch<AppState>(
          context,
          BottomNavAction(currentBottomNavIndex: 0),
        );
        Navigator.popAndPushNamed(context, AppRoutes.home);
        return false;
      },
      child: StoreConnector<AppState, PINInputViewModel>(
        converter: (Store<AppState> store) =>
            PINInputViewModel.fromStore(store.state),
        builder: (BuildContext context, PINInputViewModel vm) {
          final int tries = vm.tries ?? 0;
          final DateTime? maxTryTime = DateTime.tryParse(vm.maxTryTime ?? '');

          if (tries >= maxTries &&
              (vm.resumeTimer ?? false) &&
              !timerRunning &&
              maxTryTime != null) {
            _start = DateTime.now().difference(maxTryTime).inSeconds;
            if (_start < startTimer - 1) {
              _start = 300 - _start;
              _startTimer();
            }
          }

          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: CustomAppBar(
              bottomNavIndex: 3,
              leadingWidget: GestureDetector(
                key: pinInputPageBackKey,
                onTap: () {
                  navigateToNewPage(
                    context: context,
                    route: AppRoutes.home,
                    bottomNavIndex: 0,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    backIconPath,
                    width: 24,
                  ),
                ),
              ),
              trailingWidget: const SizedBox(),
              showBackButton: false,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  largeVerticalSizedBox,
                  SvgPicture.asset(
                    lockIcon,
                    width: 30.0,
                    height: 40.0,
                  ),
                  largeVerticalSizedBox,
                  Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          enterChatPINString,
                          style: boldSize15Text(
                            AppColors.secondaryColor,
                          ).copyWith(fontSize: 14),
                        ),
                      ),
                      //show the loader when PIN is getting verified
                      if (vm.wait!.isWaitingFor(verifyPINFlag))
                        const SizedBox(
                          width: 50,
                          height: 50,
                          child: PlatformLoader(),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                            right: 50,
                            bottom: 5,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Theme.of(context).backgroundColor,
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: widget._pinController,
                                    obscureText: true,
                                    readOnly: true,
                                    obscuringCharacter: '*',
                                    textAlign: TextAlign.center,
                                    style: normalSize24Text(
                                      AppColors.secondaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              verySmallVerticalSizedBox,
                              Text(
                                errorMessage,
                                style: errorMessageStyle,
                              ),
                            ],
                          ),
                        ),

                      KeyPadWidget(
                        key: keyPadWidgetKey,
                        onChange: (String pin) async {
                          widget._pinController.text = pin;

                          enteredPin = widget._pinController.text;
                          final bool hasConnection =
                              await widget.connectivityStatus.checkConnection();

                          StoreProvider.dispatch(
                            context,
                            UpdateConnectivityAction(
                              hasConnection: hasConnection,
                            ),
                          );
                          if (enteredPin.length == 4) {
                            widget._pinController.text = '';
                            if (hasConnection) {
                              final IGraphQlClient client =
                                  AppWrapperBase.of(context)!.graphQLClient;
                              final String endpoint =
                                  AppWrapperBase.of(context)!
                                      .customContext!
                                      .verifyPhoneEndpoint;

                              await StoreProvider.dispatch<AppState>(
                                context,
                                VerifyPINAction(
                                  endpoint: endpoint,
                                  httpClient: client,
                                  inputPIN: enteredPin,
                                ),
                              );
                              if (vm.pinVerified ?? false) {
                                setState(() {
                                  errorMessage = '';
                                });
                              } else {
                                if (tries < maxTries) {
                                  setState(() {
                                    errorMessageStyle = boldSize12Text(
                                      AppColors.wrongPinTextColor,
                                    );
                                    errorMessage = wrongPINString;
                                  });
                                } else {
                                  setState(() {
                                    WidgetsBinding.instance
                                        ?.addPostFrameCallback(
                                            (Duration timeStamp) {
                                      StoreProvider.dispatch(
                                        context,
                                        UpdatePINInputDetailsAction(
                                          maxTryTime: DateTime.now().toString(),
                                        ),
                                      );
                                    });
                                    _startTimer();
                                  });
                                }
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                snackbar(
                                  content: const Text(checkInternetText),
                                  durationSeconds: kShortSnackBarDuration,
                                ),
                              );
                            }
                          }
                        },
                        pinController: widget._pinController,
                        isCorrectPin: isCorrectPin,
                        canEnterPin: canEnterPin,
                      ),
                      GestureDetector(
                        key: forgotPINButtonKey,
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.forgotPINPage,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            forgotPINString,
                            style: normalSize15Text(
                              AppColors.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
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
