import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/answer_screening_tools_action.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/fetch_screening_questions_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/screening_tools/screening_tools_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/violence_assessment/widgets/screening_tools_question_widget.dart';
import 'package:myafyahub/presentation/violence_assessment/widgets/violence_assessment_information.dart';
import 'package:shared_themes/spaces.dart';

class ViolenceAssessmentPage extends StatefulWidget {
  const ViolenceAssessmentPage();

  @override
  State<ViolenceAssessmentPage> createState() => _ViolenceAssessmentPageState();
}

class _ViolenceAssessmentPageState extends State<ViolenceAssessmentPage> {
  @override
  void didChangeDependencies() {
    StoreProvider.dispatch(
      context,
      FetchScreeningToolsQuestionsAction(
        screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
        client: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScreeningToolsViewModel>(
      converter: (Store<AppState> store) {
        return ScreeningToolsViewModel.fromStore(store);
      },
      builder: (BuildContext context, ScreeningToolsViewModel vm) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: violenceAssessmentTitle,
          ),
          body: vm.wait!.isWaitingFor(fetchingQuestionsFlag)
              ? const PlatformLoader()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          violenceAssessmentSubtitle,
                          style: normalSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        // questions
                        ScreeningToolQuestionWidget(
                          screeningToolsQuestions: vm.violenceState!
                              .screeningQuestions!.screeningQuestionsList!,
                          screeningToolsType:
                              ScreeningToolsType.VIOLENCE_ASSESSMENT,
                        ),
                        // contains guidance information
                        const ViolenceAssessmentInformation(),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: vm.wait!.isWaitingFor(
            fetchingQuestionsFlag,
          )
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: submitViolenceAssessmentKey,
                    buttonColor: AppColors.primaryColor,
                    borderColor: Colors.transparent,
                    customChild:
                        vm.wait!.isWaitingFor(answerScreeningQuestionsFlag)
                            ? const PlatformLoader()
                            : Text(
                                submitAssessment,
                                style: veryBoldSize15Text(
                                  AppColors.whiteColor,
                                ),
                              ),
                    onPressed: () {
                      bool areAllQuestionsAnswered = false;
                      setState(
                        () {
                          areAllQuestionsAnswered = allQuestionsAnswered(
                            vm.violenceState?.screeningQuestions
                                ?.screeningQuestionsList,
                          );
                        },
                      );
                      if (areAllQuestionsAnswered) {
                        StoreProvider.dispatch(
                          context,
                          AnswerScreeningToolsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            screeningToolsType:
                                ScreeningToolsType.VIOLENCE_ASSESSMENT,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(pleaseAnswerAllQuestions),
                          ),
                        );
                      }
                    },
                  ),
                ),
        );
      },
    );
  }
}
