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
import 'package:pro_health_360/presentation/assessment/widgets/contraceptive_information.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_back_button.dart';
import 'package:pro_health_360/presentation/violence_assessment/widgets/screening_tools_question_widget.dart';

class ContraceptiveAssessmentPage extends StatefulWidget {
  const ContraceptiveAssessmentPage();

  @override
  State<ContraceptiveAssessmentPage> createState() =>
      _ContraceptiveAssessmentPageState();
}

class _ContraceptiveAssessmentPageState
    extends State<ContraceptiveAssessmentPage> {
  @override
  void didChangeDependencies() {
    StoreProvider.dispatch(
      context,
      FetchScreeningToolsQuestionsAction(
        screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
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
        'screeningToolType': ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT.name
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
            title: contraceptiveAssessmentTitle,
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    text: contraceptiveAssessmentDescription,
                                    style: normalSize14Text(
                                      AppColors.greyTextColor,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ifYouIntendToUse,
                                        style: normalSize14Text(
                                          AppColors.greyTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          size15VerticalSizedBox,
                          // questions
                          ScreeningToolQuestionWidget(
                            screeningToolsQuestions: vm.contraceptiveState!
                                .screeningQuestions!.screeningQuestionsList!,
                            screeningToolsType:
                                ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
                          ),
                          const ContraceptivesInformation(),
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
                    buttonKey: contraceptiveAssessmentFeedbackButtonKey,
                    onPressed: () {
                      bool areAllQuestionsAnswered = false;
                      setState(() {
                        areAllQuestionsAnswered = allQuestionsAnswered(
                          vm.contraceptiveState?.screeningQuestions
                              ?.screeningQuestionsList,
                        );
                      });
                      if (areAllQuestionsAnswered) {
                        StoreProvider.dispatch(
                          context,
                          AnswerScreeningToolsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            screeningToolsType:
                                ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
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
