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
import 'package:myafyahub/presentation/assessment/widgets/alcohol_assessment_information.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/violence_assessment/widgets/screening_tools_question_widget.dart';
import 'package:shared_themes/spaces.dart';

class AlcoholSubstanceUsePage extends StatefulWidget {
  const AlcoholSubstanceUsePage();

  @override
  State<AlcoholSubstanceUsePage> createState() =>
      _AlcoholSubstanceUsePageState();
}

class _AlcoholSubstanceUsePageState extends State<AlcoholSubstanceUsePage> {
  @override
  void didChangeDependencies() {
    StoreProvider.dispatch(
      context,
      FetchScreeningToolsQuestionsAction(
        screeningToolsType: ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
        client: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: alcoholSubstanceUseTitle,
      ),
      body: StoreConnector<AppState, ScreeningToolsViewModel>(
        converter: (Store<AppState> store) {
          return ScreeningToolsViewModel.fromStore(store);
        },
        builder: (BuildContext context, ScreeningToolsViewModel vm) {
          if (vm.wait!.isWaitingFor(fetchingQuestionsFlag)) {
            return const PlatformLoader();
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    largeVerticalSizedBox,
                    Text(
                      alcoholSubstanceUseDescription,
                      style: normalSize14Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                    mediumVerticalSizedBox,
                    // questions
                    ScreeningToolQuestionWidget(
                      screeningToolsQuestions: vm.alcoholSubstanceUseState!
                          .screeningQuestions!.screeningQuestionsList!,
                      screeningToolsType:
                          ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
                    ),
                    const AlcoholAssessmentInformation(),
                    mediumVerticalSizedBox,
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: MyAfyaHubPrimaryButton(
                        buttonKey: alcoholSubstanceFeedbackButtonKey,
                        onPressed: () {
                          bool areAllQuestionsAnswered = false;
                          setState(
                            () {
                              areAllQuestionsAnswered = allQuestionsAnswered(
                                vm.alcoholSubstanceUseState?.screeningQuestions
                                    ?.screeningQuestionsList,
                              );
                            },
                          );
                          if (areAllQuestionsAnswered) {
                            StoreProvider.dispatch(
                              context,
                              AnswerScreeningToolsAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                screeningToolsType: ScreeningToolsType
                                    .ALCOHOL_SUBSTANCE_ASSESSMENT,
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
                      ),
                    ),
                    size40VerticalSizedBox,
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
