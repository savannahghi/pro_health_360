// Flutter imports:

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/security_questions/get_security_questions_action.dart';
import 'package:myafyahub/application/redux/actions/security_questions/record_security_question_responses_action.dart';
import 'package:myafyahub/application/redux/actions/security_questions/verify_security_questions_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/set_security_questions/security_question_widget.dart';

class SecurityQuestionsPage extends StatefulWidget {
  const SecurityQuestionsPage();

  @override
  _SecurityQuestionsPageState createState() => _SecurityQuestionsPageState();
}

class _SecurityQuestionsPageState extends State<SecurityQuestionsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);

    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) {
        return AppStateViewModel.fromStore(store);
      },
      onInit: (Store<AppState> store) {
        StoreProvider.dispatch<AppState>(
          context,
          // retrieve the security questions
          GetSecurityQuestionsAction(context: context),
        );
      },
      builder: (BuildContext context, AppStateViewModel vm) {
        final List<SecurityQuestion> securityQuestions =
            vm.appState.onboardingState?.securityQuestions ??
                <SecurityQuestion>[];

        final List<SecurityQuestionResponse> securityQuestionsResponses =
            vm.appState.onboardingState?.securityQuestionResponses ??
                <SecurityQuestionResponse>[];

        final String userId = vm.appState.clientState!.user!.userId!;
        final bool isResetPin =
            vm.appState.onboardingState?.currentOnboardingStage ==
                CurrentOnboardingStage.ResetPIN;

        return Form(
          key: _formKey,
          child: OnboardingScaffold(
            title: isResetPin
                ? verifySecurityQuestionsString
                : setSecurityQuestionsString,
            description: isResetPin
                ? verifyQuestionsDescriptionString
                : securityQuestionsDescriptionString,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: (vm.appState.wait!
                                .isWaitingFor(getSecurityQuestionsFlag) ||
                            vm.appState.wait!
                                .isWaitingFor(recordSecurityQuestionsFlag) ||
                            vm.appState.wait!
                                .isWaitingFor(verifySecurityQuestionsFlag))
                        ? Container(
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            child: const PlatformLoader(),
                          )
                        : securityQuestionsBody(
                            securityQuestions: securityQuestions,
                            securityQuestionsResponses:
                                securityQuestionsResponses,
                            userID: userId,
                          ),
                  ),
                  if ((!vm.appState.wait!
                                  .isWaitingFor(getSecurityQuestionsFlag) &&
                              !vm.appState.wait!
                                  .isWaitingFor(recordSecurityQuestionsFlag) ||
                          !vm.appState.wait!
                              .isWaitingFor(verifySecurityQuestionsFlag)) &&
                      securityQuestions.isNotEmpty)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: isLargeScreen ? 300 : double.infinity,
                        height: 52,
                        child: MyAfyaHubPrimaryButton(
                          text: saveAndContinueButtonText,
                          buttonColor: AppColors.primaryColor,
                          onPressed: () {
                            final bool? isFormValid =
                                _formKey.currentState?.validate();

                            if (isFormValid != null && isFormValid == true) {
                              final List<SecurityQuestionResponse>
                                  emptyResponses = <SecurityQuestionResponse>[];

                              securityQuestionsResponses.asMap().forEach(
                                (int index, SecurityQuestionResponse value) {
                                  if (value.response == UNKNOWN ||
                                      value.response == '') {
                                    emptyResponses.add(value);
                                  }
                                },
                              );

                              if (emptyResponses.isEmpty) {
                                if (isResetPin) {
                                  StoreProvider.dispatch<AppState>(
                                    context,
                                    VerifySecurityQuestionAction(
                                      client: AppWrapperBase.of(context)!
                                          .graphQLClient,
                                      verifySecurityQuestionsEndpoint:
                                          AppWrapperBase.of(context)!
                                              .customContext!
                                              .verifySecurityQuestionsEndpoint!,
                                    ),
                                  );
                                } else {
                                  StoreProvider.dispatch<AppState>(
                                    context,
                                    RecordSecurityQuestionResponsesAction(
                                      context: context,
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        kindlyAnswerAllQuestionsString,
                                      ),
                                    ),
                                  );
                              }
                            }
                          },
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget securityQuestionsBody({
    required List<SecurityQuestion> securityQuestions,
    required List<SecurityQuestionResponse> securityQuestionsResponses,
    required String userID,
  }) {
    if (securityQuestions.isEmpty) {
      return GenericErrorWidget(
        actionKey: helpNoDataWidgetKey,
        headerIconSvgUrl: noSecurityQuestionsImage,
        recoverCallback: () async {
          StoreProvider.dispatch<AppState>(
            context,
            GetSecurityQuestionsAction(
              context: context,
            ),
          );
        },
        messageTitle: noQuestionsLoadedString,
        messageBody: const <TextSpan>[
          TextSpan(text: noQuestionsLoadedDescription)
        ],
      );
    } else {
      return ListView.builder(
        itemCount: securityQuestions.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        itemBuilder: (BuildContext context, int index) {
          final SecurityQuestion question = securityQuestions.elementAt(index);

          final String questionResponse =
              securityQuestionsResponses.elementAt(index).response ?? '';

          return SecurityQuestionWidget(
            securityQuestion: question,
            response: (questionResponse == UNKNOWN) ? null : questionResponse,
            onChanged: (String? value) {
              if (value != null) {
                if (question.responseType ==
                    SecurityQuestionResponseType.DATE) {
                  final String convertedDate = formatSecurityQuestionDate(
                    value,
                    format: 'dd-MM-yyyy',
                  );

                  securityQuestionsResponses[index] = SecurityQuestionResponse(
                    userID: userID,
                    securityQuestionID: question.securityQuestionID,
                    response: convertedDate,
                  );
                } else {
                  securityQuestionsResponses[index] = SecurityQuestionResponse(
                    userID: userID,
                    securityQuestionID: question.securityQuestionID,
                    response: value.trim(),
                  );
                }
              }

              StoreProvider.dispatch<AppState>(
                context,
                UpdateOnboardingStateAction(
                  securityQuestionsResponses: securityQuestionsResponses,
                ),
              );
            },
          );
        },
      );
    }
  }
}
