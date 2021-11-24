// Flutter imports:
// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/security_questions/get_security_questions_action.dart';
import 'package:myafyahub/application/redux/actions/security_questions/record_security_question_responses_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/security_questions/questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/responses/security_question_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/security_question_widget.dart';
import 'package:shared_ui_components/platform_loader.dart';

class SecurityQuestionsPage extends StatefulWidget {
  const SecurityQuestionsPage();

  @override
  _SecurityQuestionsPageState createState() => _SecurityQuestionsPageState();
}

class _SecurityQuestionsPageState extends State<SecurityQuestionsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => StoreProvider.dispatch<AppState>(
        context,
        // retrieve the security questions
        GetSecurityQuestionsAction(
          context: context,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);

    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) {
        return AppStateViewModel.fromStore(store);
      },
      builder: (BuildContext context, AppStateViewModel vm) {
        final List<SecurityQuestion> securityQuestions =
            vm.appState.onboardingState?.securityQuestions ??
                <SecurityQuestion>[];

        final List<SecurityQuestionResponse> securityQuestionsResponses =
            vm.appState.onboardingState?.securityQuestionResponses ??
                <SecurityQuestionResponse>[];

        final String userId = vm.appState.clientState!.user!.userId!;

        return Form(
          key: _formKey,
          child: OnboardingScaffold(
            title: setSecurityQuestionsString,
            description: securityQuestionsDescriptionString,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: (vm.appState.wait!
                                .isWaitingFor(getSecurityQuestionsFlag) ||
                            vm.appState.wait!
                                .isWaitingFor(recordSecurityQuestionsFlag))
                        ? Container(
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            child: const SILPlatformLoader(),
                          )
                        : ListView.builder(
                            itemCount: securityQuestions.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            itemBuilder: (BuildContext context, int index) {
                              final SecurityQuestion question =
                                  securityQuestions.elementAt(index);

                              return SecurityQuestionWidget(
                                securityQuestion: question,
                                response: (securityQuestionsResponses
                                            .elementAt(index)
                                            .response ==
                                        UNKNOWN)
                                    ? null
                                    : securityQuestionsResponses
                                        .elementAt(index)
                                        .response,
                                onChanged: (String? value) {
                                  if (question.responseType ==
                                          SecurityQuestionResponseType.DATE &&
                                      value != null) {
                                    final String convertedDate =
                                        formatSecurityQuestionDate(
                                      value,
                                      format: 'dd-MM-yyyy',
                                    );

                                    securityQuestionsResponses[index] =
                                        SecurityQuestionResponse(
                                      userID: userId,
                                      securityQuestionID:
                                          question.securityQuestionID,
                                      response: convertedDate,
                                    );
                                  } else {
                                    securityQuestionsResponses[index] =
                                        SecurityQuestionResponse(
                                      userID: userId,
                                      securityQuestionID:
                                          question.securityQuestionID,
                                      response: value,
                                    );
                                  }

                                  StoreProvider.dispatch<AppState>(
                                    context,
                                    UpdateOnboardingStateAction(
                                      securityQuestionsResponses:
                                          securityQuestionsResponses,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: isLargeScreen ? number300 : double.infinity,
                      height: number52,
                      child: MyAfyaHubPrimaryButton(
                        text: saveAndContinueButtonText,
                        buttonColor: AppColors.secondaryColor,
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
                              StoreProvider.dispatch<AppState>(
                                context,
                                RecordSecurityQuestionResponsesAction(
                                  context: context,
                                ),
                              );
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
}
