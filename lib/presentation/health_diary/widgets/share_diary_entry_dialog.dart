import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/health_diary/widgets/health_diary_entry_widget.dart';
import 'package:shared_themes/spaces.dart';

class ShareDiaryEntryDialog extends StatelessWidget {
  const ShareDiaryEntryDialog({required this.diaryEntry});

  final HealthDiaryEntry diaryEntry;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
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
              style: boldSize14Text(AppColors.greyTextColor),
            ),
            mediumVerticalSizedBox,
            HealthDiaryEntryWidget(
              diaryEntry: diaryEntry,
              isDialog: true,
            ),
            largeVerticalSizedBox,
            Row(
              children: <Widget>[
                Expanded(
                  child: MyAfyaHubPrimaryButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(comingSoonText)),
                      );
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
                  child: MyAfyaHubPrimaryButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(comingSoonText)),
                      );
                    },
                    text: shareString,
                    buttonKey: shareDiaryEntryKey,
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
