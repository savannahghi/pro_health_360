// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class SecurityQuestionsPage extends StatelessWidget {
  const SecurityQuestionsPage();

  @override
  Widget build(BuildContext context) {
    final AppState appState = StoreProvider.state<AppState>(context)!;
    final List<SecurityQuestionResponse>? securityQuestionsResponses =
        appState.onboardingState!.securityQuestionResponses;

    final String userId = appState.clientState!.user!.userId!;

    final List<SecurityQuestion> securityQuestions = <SecurityQuestion>[
      SecurityQuestion(
        securityQuestionID: 'sec_q_1',
        questionStem: whereWereYouBornString,
        responseType: '',
        flavour: Flavour.CONSUMER.name,
      ),
      SecurityQuestion(
        securityQuestionID: 'sec_q_2',
        questionStem: whatsTheNameOfYourPetString,
        responseType: '',
        flavour: Flavour.CONSUMER.name,
      ),
      SecurityQuestion(
        securityQuestionID: 'sec_q_4',
        questionStem: whereDidYouFirstLiveString,
        responseType: '',
        flavour: Flavour.CONSUMER.name,
      ),
    ];

    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    return OnboardingScaffold(
      title: setSecurityQuestionsString,
      description: securityQuestionsDescriptionString,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.6,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                itemCount: securityQuestions.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (BuildContext context, int index) {
                  final SecurityQuestion question =
                      securityQuestions.elementAt(index);
                  final SecurityQuestionResponse? questionResponse =
                      securityQuestionsResponses?.singleWhere(
                    (SecurityQuestionResponse response) =>
                        response.securityQuestionId ==
                        question.securityQuestionID,
                    orElse: () => SecurityQuestionResponse.initial(),
                  );

                  final String response = questionResponse?.response ?? UNKNOWN;
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    child: ExpandableQuestion(
                      question: question.questionStem ?? UNKNOWN,
                      hintText: answerHereString,
                      initialValue: (response == UNKNOWN) ? null : response,
                      onChanged: (String value) {
                        securityQuestionsResponses!.add(
                          SecurityQuestionResponse(
                            id: userId,
                            timeStamp: DateTime.now().toString(),
                            userId: userId,
                            securityQuestionId: question.securityQuestionID,
                            response: value,
                          ),
                        );
                        StoreProvider.dispatch<AppState>(
                          context,
                          UpdateOnboardingStateAction(
                            securityQuestionsResponses:
                                securityQuestionsResponses,
                          ),
                        );
                      },
                    ),
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
                    Navigator.pushReplacementNamed(context, BWRoutes.createPin);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
