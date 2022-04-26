// Flutter imports
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/send_feedback_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:myafyahub/presentation/profile/feedback/widgets/rating_button.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';

/// [FeedbackPage] is used to get user feedback on app usage
class FeedbackPage extends StatefulWidget {
  const FeedbackPage();

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

bool isSubmitActive({
  required FeedBackType feedBackType,
  required String feedBackText,
  required int selectedRating,
  String? searchString,
}) {
  if (feedBackType == FeedBackType.SERVICES_OFFERED) {
    if (feedBackText.isNotEmpty &&
        (searchString?.isNotEmpty ?? false) &&
        selectedRating != 0) {
      return true;
    } else {
      return false;
    }
  } else {
    if (feedBackText.isNotEmpty && selectedRating != 0) {
      return true;
    }
  }
  return false;
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController feedBackInputController = TextEditingController();
  final TextEditingController serviceInputController = TextEditingController();

  bool allowFollowUp = false;
  FeedBackType feedBackType = FeedBackType.GENERAL_FEEDBACK;
  int selectedRating = 0;
  void onRatingButtonPressed(int selectedButton) {
    setState(() {
      selectedRating = selectedButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        final List<String> feedbackTypesList = <String>[];
        for (final FeedBackType type in FeedBackType.values) {
          feedbackTypesList.add(getFeedBackTypeDescription(type));
        }
        final bool canSubmit = isSubmitActive(
          feedBackType: feedBackType,
          feedBackText: feedBackInputController.text,
          searchString: serviceInputController.text,
          selectedRating: selectedRating,
        );
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: const CustomAppBar(title: feedbackString),
          body: (vm.wait!.isWaitingFor(sendFeedbackFlag))
              ? const PlatformLoader()
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child: SvgPicture.asset(feedbackImage)),
                        mediumVerticalSizedBox,
                        Center(
                          child: Text(
                            helpUsImprove,
                            style: veryBoldSize20Text(AppColors.primaryColor),
                          ),
                        ),
                        size15VerticalSizedBox,
                        Text(
                          selectOneOption,
                          style: normalSize15Text(AppColors.greyTextColor),
                        ),
                        size15VerticalSizedBox,
                        Text(
                          feedbackType,
                          style: normalSize13Text(AppColors.greyTextColor),
                        ),
                        smallVerticalSizedBox,
                        SelectOptionField(
                          decoration: const InputDecoration(
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00eeeeee)),
                            ),
                          ),
                          value: feedbackTypesList.first,
                          options: feedbackTypesList,
                          dropDownInputKey: feedbackTypeDropDownKey,
                          onChanged: (String? name) {
                            if (name ==
                                getFeedBackTypeDescription(
                                  FeedBackType.GENERAL_FEEDBACK,
                                )) {
                              setState(() {
                                feedBackType = FeedBackType.GENERAL_FEEDBACK;
                              });
                            } else {
                              setState(() {
                                feedBackType = FeedBackType.SERVICES_OFFERED;
                              });
                            }
                          },
                        ),
                        size15VerticalSizedBox,
                        Text(
                          howSatisfiedText,
                          style: normalSize13Text(AppColors.greyTextColor),
                        ),
                        smallVerticalSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RatingButton(
                              value: 1,
                              isSelected: selectedRating == 1,
                              buttonKey: oneRatingButtonKey,
                              onPressed: onRatingButtonPressed,
                            ),
                            RatingButton(
                              buttonKey: twoRatingButtonKey,
                              value: 2,
                              isSelected: selectedRating == 2,
                              onPressed: onRatingButtonPressed,
                            ),
                            RatingButton(
                              value: 3,
                              buttonKey: threeRatingButtonKey,
                              isSelected: selectedRating == 3,
                              onPressed: onRatingButtonPressed,
                            ),
                            RatingButton(
                              value: 4,
                              buttonKey: fourRatingButtonKey,
                              isSelected: selectedRating == 4,
                              onPressed: onRatingButtonPressed,
                            ),
                            RatingButton(
                              value: 5,
                              buttonKey: fiveRatingButtonKey,
                              isSelected: selectedRating == 5,
                              onPressed: onRatingButtonPressed,
                            ),
                          ],
                        ),
                        smallVerticalSizedBox,
                        Text(
                          ratingsHint,
                          style: normalSize12Text(AppColors.greyTextColor),
                        ),
                        smallVerticalSizedBox,
                        if (feedBackType == FeedBackType.SERVICES_OFFERED)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              mediumVerticalSizedBox,
                              Text(
                                serviceName,
                                style:
                                    normalSize13Text(AppColors.greyTextColor),
                              ),
                              size15VerticalSizedBox,
                              TextField(
                                key: serviceTextFieldKey,
                                controller: serviceInputController,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.listCardColor,
                                  border: InputBorder.none,
                                  hintText: serviceNamePrompt,
                                  hintStyle: normalSize13Text(
                                    AppColors.greyTextColor.withOpacity(0.7),
                                  ),
                                ),
                                onChanged: (String? text) => setState(() {}),
                              ),
                              size15VerticalSizedBox,
                            ],
                          ),
                        mediumVerticalSizedBox,
                        Text(
                          shareYourThoughts,
                          style: normalSize13Text(AppColors.greyTextColor),
                        ),
                        size15VerticalSizedBox,
                        TextField(
                          key: feedbackTextFieldKey,
                          controller: feedBackInputController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 4,
                          onChanged: (String? text) => setState(() {}),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.listCardColor,
                            border: InputBorder.none,
                            hintText: shareYourThoughtsPrompt,
                            hintStyle: normalSize13Text(
                              AppColors.greyTextColor.withOpacity(0.7),
                            ),
                          ),
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          followUpOnFeedbackString,
                          style: normalSize14Text(AppColors.greyTextColor),
                        ),
                        size15VerticalSizedBox,
                        Row(
                          children: <Widget>[
                            MoodSymptomWidget(
                              title: yesString,
                              gestureKey: yesFeedbackKey,
                              isSelected: allowFollowUp,
                              onTap: () {
                                setState(() {
                                  allowFollowUp = true;
                                });
                              },
                            ),
                            mediumHorizontalSizedBox,
                            MoodSymptomWidget(
                              gestureKey: noFeedbackKey,
                              title: noString,
                              isSelected: !allowFollowUp,
                              onTap: () {
                                setState(() {
                                  allowFollowUp = false;
                                });
                              },
                            ),
                          ],
                        ),
                        size70VerticalSizedBox,
                      ],
                    ),
                  ),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            height: 48,
            width: double.infinity,
            child: MyAfyaHubPrimaryButton(
              buttonKey: sendFeedbackButtonKey,
              onPressed: canSubmit
                  ? () async {
                      await StoreProvider.dispatch<AppState>(
                        context,
                        SendFeedbackAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                          satisfactionLevel: selectedRating,
                          serviceName:
                              (feedBackType == FeedBackType.SERVICES_OFFERED)
                                  ? serviceInputController.text
                                  : '',
                          feedbackType: feedBackType.name,
                          feedback: feedBackInputController.text,
                          requiresFollowUp: allowFollowUp,
                          onSuccess: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.successfulFeedbackSubmissionPage,
                            );
                          },
                          onError: () {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    feedbackSubmissionErrorText,
                                  ),
                                ),
                              );
                          },
                        ),
                      );
                    }
                  : () => ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          getFeedBackValidationMessage(
                            feedBackType: feedBackType,
                            feedBackText: feedBackInputController.text,
                            searchString: serviceInputController.text,
                            selectedRating: selectedRating,
                          ),
                        ),
                        duration: const Duration(
                          seconds: kShortSnackBarDuration,
                        ),
                      ),
                    ),
              buttonColor: canSubmit ? AppColors.primaryColor : Colors.grey,
              borderColor: Colors.transparent,
              text: submitFeedbackString,
              textStyle: veryBoldSize15Text(Colors.white),
            ),
          ),
        );
      },
    );
  }
}
