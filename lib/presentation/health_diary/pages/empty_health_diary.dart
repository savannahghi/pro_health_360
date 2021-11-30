// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class EmptyHealthDiary extends StatelessWidget {
  const EmptyHealthDiary({required this.refreshCallback});

  final void Function() refreshCallback;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            emptyDiaryEntryImage,
            height: size.height / 3,
            width: size.width,
          ),
          Text(
            diaryEmptyTitle,
            textAlign: TextAlign.center,
            style: TextThemes.boldSize20Text(),
          ),
          smallVerticalSizedBox,
          Text(
            diaryEmptyDescription,
            textAlign: TextAlign.center,
            style: TextThemes.normalSize15Text(AppColors.greyTextColor),
          ),
          verySmallVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: MyAfyaHubPrimaryButton(
                buttonKey: healthDiaryRetryButtonKey,
                text: addDiaryString,
                textColor: AppColors.whiteColor,
                buttonColor: Theme.of(context).primaryColor,
                borderColor: Colors.transparent,
                onPressed: refreshCallback,
              ),
            ),
          )
        ],
      ),
    );
  }
}
