import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/presentation/content/widgets/copy_content_link_widget.dart';
import 'package:pro_health_360/presentation/content/widgets/like_content_widget.dart';
import 'package:pro_health_360/presentation/content/widgets/save_content_widget.dart';
import 'package:pro_health_360/presentation/content/widgets/share_content_widget.dart';

class ReactionsWidget extends StatelessWidget {
  const ReactionsWidget({Key? key, required this.contentDetails})
      : super(key: key);

  final ContentDetails contentDetails;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 15,
        children: <Widget>[
          // Like icon
          LikeContentWidget(
            contentID: contentDetails.content.contentID ?? 0,
            contentDisplayedType: contentDetails.contentDisplayedType,
          ),

          // Share icon
          ShareContentWidget(
            link: contentDetails.content.metadata?.publicLink,
            title: contentDetails.content.title ?? UNKNOWN,
            contentID: contentDetails.content.contentID ?? 0,
          ),

          // Save icon
          SaveContentWidget(
            contentID: contentDetails.content.contentID ?? 0,
            contentDisplayedType: contentDetails.contentDisplayedType,
          ),

          CopyContentLinkWidget(
            publicLink: contentDetails.content.metadata?.publicLink,
            contentID: contentDetails.content.contentID ?? 0,
          )
        ],
      ),
    );
  }
}
