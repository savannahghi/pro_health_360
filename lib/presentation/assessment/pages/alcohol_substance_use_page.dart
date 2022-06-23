import 'package:afya_moja_core/afya_moja_core.dart';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/answer_screening_tools_action.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/fetch_screening_questions_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/screening_tools/screening_tools_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/assessment/widgets/alcohol_assessment_information.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_back_button.dart';
import 'package:pro_health_360/presentation/violence_assessment/widgets/screening_tools_question_widget.dart';

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

  Future<bool> onWillPop() async {
    // log abandoning assessment tool
    await AnalyticsService().logEvent(
      name: abandonScreeningToolEvent,
      eventType: AnalyticsEventType.INTERACTION,
      parameters: <String, dynamic>{
        'screeningToolType':
            ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT.name
      },
    );
    Navigator.of(context).pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScreeningToolsViewModel>(
      converter: (Store<AppState> store) {
        return ScreeningToolsViewModel.fromStore(store);
      },
      builder: (BuildContext context, ScreeningToolsViewModel vm) {
        return Scaffold(
          appBar: CustomAppBar(
            title: alcoholSubstanceUseTitle,
            showBackButton: false,
            leadingWidget: CustomBackButton(onTapped: () => onWillPop()),
          ),
          body: WillPopScope(
            onWillPop: onWillPop,
            child: vm.wait!.isWaitingFor(fetchingQuestionsFlag)
                ? Container(
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    child: const PlatformLoader(),
                  )
                : SingleChildScrollView(
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
                            screeningToolsQuestions: vm
                                .alcoholSubstanceUseState!
                                .screeningQuestions!
                                .screeningQuestionsList!,
                            screeningToolsType:
                                ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
                          ),
                          const AlcoholAssessmentInformation(),
                          size40VerticalSizedBox,
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          floatingActionButton: vm.wait!.isWaitingFor(fetchingQuestionsFlag)
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            screeningToolsType:
                                ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
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
        );
      },
    );
  }
}
