import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
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
import 'package:shared_themes/spaces.dart';

class TuberculosisAssessmentPage extends StatefulWidget {
  const TuberculosisAssessmentPage();

  @override
  State<TuberculosisAssessmentPage> createState() =>
      _TuberculosisAssessmentPageState();
}

class _TuberculosisAssessmentPageState
    extends State<TuberculosisAssessmentPage> {
  @override
  void didChangeDependencies() {
    StoreProvider.dispatch(
      context,
      FetchScreeningToolsQuestionsAction(
        screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
        client: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: tuberculosisAssessmentTitle,
      ),
      body: StoreConnector<AppState, ScreeningToolsViewModel>(
        converter: (Store<AppState> store) {
          return ScreeningToolsViewModel.fromStore(store);
        },
        builder: (BuildContext context, ScreeningToolsViewModel vm) {
          final double appBarHeight = AppBar().preferredSize.height;
          if (vm.wait!.isWaitingFor(fetchingTBQuestionsFlag)) {
            return const PlatformLoader();
          } else {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - appBarHeight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    largeVerticalSizedBox,
                    Text(
                      tuberculosisAssessmentDescription,
                      style: normalSize14Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      pleaseVisitClinic,
                      style: normalSize14Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                    mediumVerticalSizedBox,
                    // questions
                    ScreeningToolQuestionWidget(
                      screeningToolsQuestions: vm
                          .tBState!.screeningQuestions!.screeningQuestionsList!,
                      screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
                    ),
                    const Spacer(),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                          right: 10,
                          left: 10,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: MyAfyaHubPrimaryButton(
                            buttonKey: tuberculosisAssessmentFeedbackButtonKey,
                            onPressed: () {
                              StoreProvider.dispatch(
                                context,
                                AnswerScreeningToolsAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  screeningToolsType:
                                      ScreeningToolsType.TB_ASSESSMENT,
                                ),
                              );
                            },
                            buttonColor: AppColors.primaryColor,
                            borderColor: Colors.transparent,
                            customChild: vm.wait!
                                    .isWaitingFor(answerScreeningQuestionsFlag)
                                ? const PlatformLoader()
                                : Text(
                                    submitAssessment,
                                    style: veryBoldSize15Text(
                                      AppColors.whiteColor,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
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
