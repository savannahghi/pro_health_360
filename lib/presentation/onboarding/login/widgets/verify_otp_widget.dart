import 'package:afya_moja_core/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/pin_input_field_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/src/animated_count.dart';
import 'package:shared_ui_components/src/constants.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:user_feed/user_feed.dart';

class VerifyOtpWidget extends StatefulWidget {
  const VerifyOtpWidget({
    Key? key,
    required this.phoneNo,
    required this.userID,
    required this.otp,
    required this.loader,
    required this.appWrapperContext,
    required this.client,
    this.successCallBack,
    this.httpClient,
  }) : super(key: key);

  final dynamic appWrapperContext;
  final Client? httpClient;
  final Widget loader;
  final String otp;
  final String phoneNo;
  final String userID;
  final IGraphQlClient client;

  final Function? successCallBack;

  @override
  VerifyOtpWidgetState createState() => VerifyOtpWidgetState();
}

class VerifyOtpWidgetState extends State<VerifyOtpWidget>
    with SingleTickerProviderStateMixin, CodeAutoFill {
  Animation<double>? animation;
  bool canResend = false;
  BehaviorSubject<bool> canResendOtp = BehaviorSubject<bool>.seeded(false);
  VerifyPhoneOtpBehaviorSubject verifyPhoneOtpBehaviorSubject =
      VerifyPhoneOtpBehaviorSubject();
  String? otp;
  String testCode = '1234';
  int resendTimeout = 60;
  TextEditingController textEditingController = TextEditingController();

  late AnimationController _controller;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return verifyOTPState;
  }

  @override
  void codeUpdated() {
    setState(() {
      // update the controller with the detected code
      textEditingController.text = code ?? testCode;
    });
  }

  @override
  void didChangeDependencies() {
    canResendOtp.listen((bool value) {
      setState(() {
        canResend = value;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    otp = widget.otp;

    // listen for otp code sent via sms
    listenForCode();
    _controller =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    animation = Tween<double>(begin: resendTimeout.toDouble(), end: 0)
        .animate(_controller)
      ..addListener(() {
        if (resendTimeout == 0) {
          canResendOtp.add(true);
        }
        setState(() {
          resendTimeout = int.parse(animation!.value.toStringAsFixed(0));
        });
      });
    _controller.forward();
    super.initState();
  }

  void restartTimer() {
    resendTimeout = 90;
    _controller.value = 0;
    _controller.forward();
    canResendOtp.add(false);
  }

  void toggleLoading() {
    setState(() {
      final bool loading = verifyPhoneOtpBehaviorSubject.loading.valueOrNull!;
      verifyPhoneOtpBehaviorSubject.loading.add(!loading);
    });
  }

  Future<bool> generateResendOtp({
    required String userID,
    required String phoneNumber,
  }) async {
    final http.Response result = await widget.client.query(
      resendOTPQuery,
      resendOTPQueryVariables(
        userID,
        phoneNumber,
        Flavour.CONSUMER,
      ),
    );

    final Map<String, dynamic> data = widget.client.toMap(result);

    final String? parseError = widget.client.parseError(data);

    if (parseError != null) {
      return false;
    }

    final dynamic otp = data['data']['resendOTP'];
    return otp as bool;
  }

  Future<void> graphResendOtp({
    required String userID,
    required String phoneNumber,
    required Function resetTimer,
  }) async {
    toggleLoading();

    await generateResendOtp(
      phoneNumber: phoneNumber,
      userID: userID,
    );

    resetTimer();
    toggleLoading();
  }

  @override
  Widget build(BuildContext context) {
    final bool isloading = verifyPhoneOtpBehaviorSubject.loading.valueOrNull!;

    return Column(
      children: <Widget>[
        smallVerticalSizedBox,
        PINInputField(
          maxLength: 4,
          onDone: (String v) async {
            if (v == otp) {
              toggleLoading();
              widget.successCallBack!(otp: otp, toggleLoading: toggleLoading);
              toggleLoading();
              return;
            }
          },
          onTextChanged: (String v) async {
            if (v.length == 4) {
              if (v == otp) {
                toggleLoading();
                Future<void>.delayed(const Duration(seconds: 3), () {
                  widget.successCallBack!(
                    otp: otp,
                    toggleLoading: toggleLoading,
                  );
                  toggleLoading();
                });
                return;
              }
            }
          },
        ),
        largeVerticalSizedBox,
        if (isloading == true) ...<Widget>[
          mediumVerticalSizedBox,
          widget.loader,
        ],
        if (isloading == false) ...<Widget>[
          if (!canResend)
            Column(
              children: <Widget>[
                Text(
                  anOtpHasBeenSentText(widget.phoneNo),
                ),
                smallVerticalSizedBox,
                AnimatedCount(
                  count: resendTimeout,
                  duration: Duration.zero,
                ),
              ],
            ),
          if (canResend)
            MyAfyaHubPrimaryButton(
              buttonKey: resendOtpButtonKey,
              customRadius: 4,
              text: sendCodeAgain,
              textColor: AppColors.whiteColor,
              buttonColor: AppColors.secondaryColor,
              borderColor: Theme.of(context).primaryColor,
              onPressed: () async {
                await graphResendOtp(
                  userID: widget.userID,
                  phoneNumber: widget.phoneNo,
                  resetTimer: restartTimer,
                );
              },
            ),
        ],
        largeVerticalSizedBox
      ],
    );
  }
}

class VerifyPhoneOtpBehaviorSubject {
  static final VerifyPhoneOtpBehaviorSubject _singleton =
      VerifyPhoneOtpBehaviorSubject._internal();

  factory VerifyPhoneOtpBehaviorSubject() {
    return _singleton;
  }

  VerifyPhoneOtpBehaviorSubject._internal();

  BehaviorSubject<bool> loading = BehaviorSubject<bool>.seeded(false);
}
