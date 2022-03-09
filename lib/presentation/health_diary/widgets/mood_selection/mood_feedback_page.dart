// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/create_health_diary_action.dart';
import 'package:myafyahub/application/redux/actions/update_health_diary_state.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:shared_themes/spaces.dart';

class MoodFeedbackPage extends StatefulWidget {
  /// [MoodFeedbackPage] is used to get user feedback based on their current mood.
  ///
  const MoodFeedbackPage({Key? key, required this.moodType}) : super(key: key);

  final MoodType moodType;

  @override
  State<MoodFeedbackPage> createState() => _MoodFeedbackPageState();
}

class _MoodFeedbackPageState extends State<MoodFeedbackPage> {
  final TextEditingController feedBackInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool shouldSelectSymptoms = widget.moodType == MoodType.NEUTRAL ||
        widget.moodType == MoodType.SAD ||
        widget.moodType == MoodType.VERY_SAD;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: StoreConnector<AppState, AppStateViewModel>(
            converter: (Store<AppState> store) =>
                AppStateViewModel.fromStore(store),
            builder: (BuildContext context, AppStateViewModel vm) {
              final bool shouldShare = vm.appState.clientState!
                      .healthDiaryState!.shouldShareHealthRecord ??
                  false;

              final bool shouldNotShare = vm.appState.clientState!
                      .healthDiaryState!.shouldNotShareHealthRecord ??
                  true;

              return Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      key: moodFeedbackGestureDetectorKey,
                      onTap: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          UpdateHealthDiaryStateActon(
                            shouldShareHealthRecord: false,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 32,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                largeVerticalSizedBox,
                                Center(
                                  child: SvgPicture.asset(
                                    widget.moodType.iconString,
                                    color: AppColors.primaryColor,
                                    height: 100,
                                  ),
                                ),
                                mediumVerticalSizedBox,
                                Center(
                                  child: Text(
                                    '$iAmFeelingText${widget.moodType.name}',
                                    style: boldSize22Text(),
                                  ),
                                ),
                                largeVerticalSizedBox,
                                // TODO: (paul) hook the returned moods from backend
                                // Text(
                                //   selectWhatBestDescribesHowYourCurrentConditionString,
                                //   style:  normalSize16Text(
                                //     AppColors.greyTextColor,
                                //   ),
                                // ),
                                // mediumVerticalSizedBox,
                                // if (shouldSelectSymptoms)
                                //   Wrap(
                                //     spacing: 12.0,
                                //     runSpacing: 12.0,
                                //     children: const <Widget>[
                                //       MoodSymptomWidget(
                                //         title: iHaveNightSweatsString,
                                //       ),
                                //       MoodSymptomWidget(
                                //         title: iHaveAFeverString,
                                //         isSelected: true,
                                //       ),
                                //       MoodSymptomWidget(
                                //         title: imCoughingString,
                                //       ),
                                //       MoodSymptomWidget(
                                //         title: iVeLostWeightString,
                                //       ),
                                //     ],
                                //   ),
                                mediumVerticalSizedBox,
                                mediumVerticalSizedBox,
                                Text(
                                  elaborateString,
                                  style: normalSize16Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                                smallVerticalSizedBox,
                                TextField(
                                  key: moodFeedbackTextFieldKey,
                                  controller: feedBackInputController,
                                  keyboardType: TextInputType.multiline,
                                  style: normalSize14Text(
                                    AppColors.greyTextColor,
                                  ),
                                  maxLines: 9,
                                  minLines: 8,
                                  decoration: InputDecoration(
                                    hintText: addNotesString,
                                    hintStyle: normalSize14Text(
                                      AppColors.greyTextColor.withOpacity(0.4),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.inputGreyColor,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(6),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.primaryColor
                                            .withOpacity(0.3),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(6),
                                      ),
                                    ),
                                    focusColor: AppColors.greyTextColor,
                                  ),
                                ),
                                largeVerticalSizedBox,
                                if (shouldSelectSymptoms) ...<Widget>[
                                  Text(
                                    shareDiaryEntryPrompt,
                                    style: normalSize16Text(
                                      AppColors.greyTextColor,
                                    ),
                                  ),
                                  mediumVerticalSizedBox,
                                  Wrap(
                                    spacing: 12.0,
                                    runSpacing: 12.0,
                                    children: <Widget>[
                                      MoodSymptomWidget(
                                        title: yesString,
                                        isSelected: shouldShare,
                                        gestureKey: shareHealthDiaryKey,
                                        onTap: () {
                                          StoreProvider.dispatch(
                                            context,
                                            UpdateHealthDiaryStateActon(
                                              shouldShareHealthRecord: true,
                                              shouldNotShareHealthRecord: false,
                                            ),
                                          );
                                        },
                                      ),
                                      MoodSymptomWidget(
                                        title: noString,
                                        isSelected: shouldNotShare,
                                        gestureKey: dontShareHealthDiaryKey,
                                        onTap: () {
                                          StoreProvider.dispatch(
                                            context,
                                            UpdateHealthDiaryStateActon(
                                              shouldShareHealthRecord: false,
                                              shouldNotShareHealthRecord: true,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                        child: vm.appState.wait!
                                .isWaitingFor(createHealthDiaryFlag)
                            ? const PlatformLoader(
                                color: AppColors.secondaryColor,
                              )
                            : MyAfyaHubPrimaryButton(
                                buttonKey: moodFeedbackButtonKey,
                                onPressed: () {
                                  if (feedBackInputController.text.isNotEmpty) {
                                    StoreProvider.dispatch<AppState>(
                                      context,
                                      CreateHealthDiaryAction(
                                        context: context,
                                        mood: widget.moodType.value,
                                        note: feedBackInputController.text,
                                      ),
                                    );
                                  }
                                },
                                buttonColor: AppColors.primaryColor,
                                borderColor: Colors.transparent,
                                text: saveString,
                                textStyle: heavySize18Text(
                                  AppColors.whiteColor,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
