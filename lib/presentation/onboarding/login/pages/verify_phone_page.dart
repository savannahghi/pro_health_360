// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/domain/core/entities/core/dynamic_back_route_holder.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/verify_otp_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class VerifyPhonePage extends StatefulWidget {
  @override
  VerifyPhonePageState createState() => VerifyPhonePageState();
}

class VerifyPhonePageState extends State<VerifyPhonePage> {
  final bool isValid = false;
  bool isLoading = true;
  final TextEditingController otpEditingController = TextEditingController();

  Future<bool> generateSendOtp({
    required String userID,
    required String phoneNumber,
  }) async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
    final http.Response result = await _client.query(
      sendOTPQuery,
      sendOTPQueryVariables(
        userID,
        phoneNumber,
        Flavour.CONSUMER,
      ),
    );

    final Map<String, dynamic> data = _client.toMap(result);

    final String? parseError = _client.parseError(data);

    if (parseError != null) {
      return false;
    }

    final dynamic otp = data['data']['sendOTP'];
    return otp as bool;
  }

  Future<void> graphSendOtp(BuildContext context) async {
    final AppState? appState = StoreProvider.state<AppState>(context);
    final String userID = appState!.clientState!.user!.userId ?? UNKNOWN;
    final String phoneNumber =
        appState.clientState!.user!.primaryContact!.contact ?? UNKNOWN;

    if (userID != UNKNOWN && phoneNumber != UNKNOWN) {
      await generateSendOtp(
        phoneNumber: '+254704002748',
        userID: 'some-user-id',
      );
    }

    toggleLoading();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await graphSendOtp(context);
    });
  }

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppState? appState = StoreProvider.state<AppState>(context);
    final String userID = appState!.clientState!.user!.userId ?? UNKNOWN;
    final String phoneNumber =
        appState.clientState!.user!.primaryContact!.contact ?? UNKNOWN;

    final String otp = appState.onboardingState!.otp ?? UNKNOWN;

    return OnboardingScaffold(
      title: verifyPhoneNumberTitle,
      description: verifyPhoneNumberDescription,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            enterOTPString,
            style: TextThemes.boldSize16Text(AppColors.secondaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Center(
              child: Column(
                children: <Widget>[
                  if (isLoading) const SILPlatformLoader(),
                  if (!isLoading)
                    VerifyOtpWidget(
                      phoneNo: phoneNumber,
                      userID: userID,
                      otp: otp,
                      loader: const SILPlatformLoader(),
                      client: AppWrapperBase.of(context)!.graphQLClient,
                      appWrapperContext:
                          EndPointsContextSubject().contexts.valueOrNull,
                      successCallBack: ({
                        required String otp,
                        required Function toggleLoading,
                      }) async {
                        // set back route
                        DynamicBackRouteHolder()
                            .createPINPage
                            .add(BWRoutes.phoneLogin);
                        // navigate to create new Terms and Conditions
                        await Navigator.pushReplacementNamed(
                          context,
                          BWRoutes.termsAndConditions,
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
