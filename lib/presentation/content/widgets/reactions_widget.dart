import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/content/widgets/like_content_widget.dart';
import 'package:myafyahub/presentation/content/widgets/save_content_widget.dart';
import 'package:myafyahub/presentation/content/widgets/share_content_widget.dart';
import 'package:shared_themes/spaces.dart';

class ReactionsWidget extends StatelessWidget {
  const ReactionsWidget({Key? key, required this.contentDetails}) : super(key: key);

  final ContentDetails contentDetails;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 15,
        children: <Widget>[
          LikeContentWidget(
            contentID: contentDetails.content.contentID ?? 0,
            contentDisplayedType: contentDetails.contentDisplayedType,
          ),
          ShareContentWidget(
            link: contentDetails.content.metadata?.publicLink,
            title: contentDetails.content.title ?? UNKNOWN,
            contentID: contentDetails.content.contentID ?? 0,
          ),
          verySmallHorizontalSizedBox,
          SaveContentWidget(
            contentID: contentDetails.content.contentID ?? 0,
            contentDisplayedType: contentDetails.contentDisplayedType,
          ),
        ],
      ),
    );
  }
}
