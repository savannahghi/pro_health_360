import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/send_content_engagement_time_action.dart';
import 'package:pro_health_360/presentation/content/widgets/reactions_widget.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class ContentDetailPage extends StatelessWidget {
  const ContentDetailPage({Key? key, required this.payload, this.showReactions})
      : super(key: key);
  final ContentDetails payload;
  final bool? showReactions;

  @override
  Widget build(BuildContext context) {
    return ContentDetailWidget(
      payload: payload,
      reactionsWidget: showReactions ?? true
          ? ReactionsWidget(contentDetails: payload)
          : const SizedBox(),
      onCloseCallback: () {
        StoreProvider.dispatch(context, SendContentEngagementTimeAction());
        Navigator.of(context).pop();
      },
      galleryImageCallback: () {
        if (payload.content.galleryImages != null &&
            payload.content.galleryImages!.length > 3) {
          Navigator.of(context).pushNamed(
            AppRoutes.galleryImagesPage,
            arguments: payload.content.galleryImages,
          );
        }
      },
    );
  }
}
