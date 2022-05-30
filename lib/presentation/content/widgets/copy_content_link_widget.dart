// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_events.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

/// [CopyContentLinkWidget] Displays like status on the content details page
class CopyContentLinkWidget extends StatelessWidget {
  const CopyContentLinkWidget({
    Key? key,
    this.publicLink,
    required this.contentID,
  }) : super(key: key);

  final int contentID;
  final String? publicLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: copyButtonKey,
      onTap: () async {
        // Add copy to clipboard logic here
        Clipboard.setData(ClipboardData(text: publicLink)).then((_) async {
          await logUserEvent(
            name: copyContentEvent,
            state: StoreProvider.state<AppState>(context),
            eventType: AnalyticsEventType.CONTENT_INTERACTION_EVENT,
            parameters: <String, dynamic>{
              'contentID': contentID,
            },
          );

          showTextSnackbar(
            ScaffoldMessenger.of(context),
            content: linkCopiedString,
          );
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 10.0,
        ),
        margin: const EdgeInsets.only(right: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: AppColors.unSelectedReactionBackgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              copyIconSvgPath,
              width: 20,
              height: 20,
              color: AppColors.unSelectedReactionIconColor,
            ),
            smallHorizontalSizedBox,
            Text(
              copyString,
              style: boldSize13Text(
                AppColors.unSelectedReactionIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
