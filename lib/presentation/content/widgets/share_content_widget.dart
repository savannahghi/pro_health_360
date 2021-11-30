// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share/share.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/share_content_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class ShareContentWidget extends StatelessWidget {
  const ShareContentWidget({
    required this.title,
    this.link,
    required this.contentID,
  });
  final int contentID;
  final String title;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: shareButtonKey,
      onTap: () async {
        if (link != null && link != UNKNOWN && link!.isNotEmpty) {
          Share.share(
            link!,
            subject: title,
          );
          await StoreProvider.dispatch(
            context,
            ShareContentAction(
              contentID: contentID,
              context: context,
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 10.0,
        ),
        margin: const EdgeInsets.only(right: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: AppColors.unSelectedReactionBackgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              shareIconUrl,
              width: 20,
              height: 20,
              color: AppColors.unSelectedReactionIconColor,
            ),
            smallHorizontalSizedBox,
            Text(
              shareString,
              style: TextThemes.boldSize13Text(
                AppColors.unSelectedReactionIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
