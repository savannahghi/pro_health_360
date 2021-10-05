import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// [AwaitingModerationWidget] used within [SentMessageItem] to show messages awaiting moderation.
class AwaitingModerationWidget extends StatelessWidget {
  /// [AwaitingModerationWidget] used within [SentMessageItem] to show messages awaiting moderation.
  ///
  const AwaitingModerationWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          awaitingModerationString,
          style: TextThemes.normalSize12Text()
              .copyWith(color: AppColors.darkGreyTextColor),
        ),
        verySmallHorizontalSizedBox,
        SvgPicture.asset(
          awaitingModerationIcon,
          color: AppColors.darkGreyTextColor,
          width: 18,
          height: 18,
        ),
      ],
    );
  }
}
