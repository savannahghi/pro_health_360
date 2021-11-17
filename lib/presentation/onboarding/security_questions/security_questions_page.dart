// Flutter imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:myafyahub/application/redux/actions/get_security_questions_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_ui_components/platform_loader.dart';

class SecurityQuestionsPage extends StatefulWidget {
  const SecurityQuestionsPage();

  @override
  _SecurityQuestionsPageState createState() => _SecurityQuestionsPageState();
}

class _SecurityQuestionsPageState extends State<SecurityQuestionsPage> {
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
    final AppState appState = StoreProvider.state<AppState>(context)!;
    final Map<String, SecurityQuestionResponse> securityQuestionsResponses =
        appState.userProfileState!.securityQuestionsResponses!;
    final String userId = appState.userProfileState!.userProfile!.id!;

    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        final List<SecurityQuestion> securityQuestions =
            vm.appState.userProfileState!.securityQuestions!;

        return OnboardingScaffold(
          title: setSecurityQuestionsString,
          description: securityQuestionsDescriptionString,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.6,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: vm.appState.wait!
                          .isWaitingFor(getSecurityQuestionsFlag)
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
                            final SecurityQuestionResponse? questionResponse =
                                securityQuestionsResponses[
                                    question.securityQuestionID];

                            final String response =
                                questionResponse?.response ?? UNKNOWN;
                            return Container(
                              padding: const EdgeInsets.all(10.0),
                              child: ExpandableQuestion(
                                question: question.questionStem,
                                hintText: answerHereString,
                                initialValue:
                                    (response == UNKNOWN) ? null : response,
                                onChanged: (String value) {
                                  securityQuestionsResponses[
                                          question.securityQuestionID] =
                                      SecurityQuestionResponse(
                                    id: userId,
                                    timeStamp: DateTime.now().toString(),
                                    userId: userId,
                                    securityQuestionId:
                                        question.securityQuestionID,
                                    response: value,
                                  );
                                  StoreProvider.dispatch<AppState>(
                                    context,
                                    UpdateUserProfileAction(
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
                        Navigator.pushReplacementNamed(
                          context,
                          BWRoutes.createPin,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
