import 'package:flutter/material.dart';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/share_diary_entry_action.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/content/health_diary_view_model.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/health_diary/widgets/health_diary_entry_widget.dart';

class ShareDiaryEntryDialog extends StatefulWidget {
  const ShareDiaryEntryDialog({required this.diaryEntry});

  final HealthDiaryEntry diaryEntry;

  @override
  State<ShareDiaryEntryDialog> createState() => _ShareDiaryEntryDialogState();
}

class _ShareDiaryEntryDialogState extends State<ShareDiaryEntryDialog> {
  bool canShareEntireEntry = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              shareDiaryEntry,
              style: boldSize20Text(AppColors.blackColor),
            ),
            size15VerticalSizedBox,
            Text(
              shareDiaryEntryTitle,
              style: normalSize14Text(AppColors.greyTextColor),
            ),
            mediumVerticalSizedBox,
            HealthDiaryEntryWidget(
              diaryEntry: widget.diaryEntry,
              isDialog: true,
            ),
            size15VerticalSizedBox,
            Text(
              wouldYouLikeToShareEntireText,
              style: normalSize14Text(AppColors.greyTextColor),
            ),
            size15VerticalSizedBox,
            Row(
              children: <Widget>[
                MoodSymptomWidget(
                  title: yesString,
                  gestureKey: yesShareEntireEntryKey,
                  isSelected: canShareEntireEntry,
                  onTap: () {
                    setState(() {
                      canShareEntireEntry = true;
                    });
                  },
                ),
                size15HorizontalSizedBox,
                MoodSymptomWidget(
                  title: noString,
                  gestureKey: noShareEntireEntryKey,
                  isSelected: !canShareEntireEntry,
                  onTap: () {
                    setState(() {
                      canShareEntireEntry = false;
                    });
                  },
                ),
              ],
            ),
            mediumVerticalSizedBox,
            Row(
              children: <Widget>[
                Expanded(
                  child: MyAfyaHubPrimaryButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: cancelString,
                    buttonColor: AppColors.primaryColor.withOpacity(0.2),
                    borderColor: Colors.transparent,
                    textColor: AppColors.primaryColor,
                    buttonKey: cancelShareDiaryEntryKey,
                  ),
                ),
                smallHorizontalSizedBox,
                Expanded(
                  child: StoreConnector<AppState, HealthDiaryViewModel>(
                    converter: (Store<AppState> store) {
                      return HealthDiaryViewModel.fromStore(store.state);
                    },
                    builder: (BuildContext context, HealthDiaryViewModel vm) {
                      return MyAfyaHubPrimaryButton(
                        onPressed: () {
                          StoreProvider.dispatch(
                            context,
                            ShareDiaryEntryAction(
                              canShareEntireDiaryEntry: canShareEntireEntry,
                              client: AppWrapperBase.of(context)!.graphQLClient,
                              onSuccess: () {
                                Navigator.popAndPushNamed(
                                  context,
                                  AppRoutes.successfulEntryPage,
                                  arguments: DiaryEntrySuccessType.shared,
                                );
                              },
                              onFailure: () {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(diaryEntryNotShared),
                                  ),
                                );
                              },
                              healthDiaryEntryID: widget.diaryEntry.id!,
                            ),
                          );
                        },
                        customChild: vm.wait!.isWaitingFor(shareDiaryEntryFlag)
                            ? const SizedBox(
                                height: 20,
                                child: PlatformLoader(),
                              )
                            : Text(
                                shareString,
                                style: veryBoldSize15Text(AppColors.whiteColor),
                              ),
                        buttonKey: shareDiaryEntryKey,
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
