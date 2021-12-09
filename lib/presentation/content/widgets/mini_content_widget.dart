// Flutter imports:
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_details.dart';
import 'package:myafyahub/presentation/router/routes.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

/// Mini content widget is used to display content at a glance
class MiniContentWidget extends StatelessWidget {
  final Content? contentDetails;

  const MiniContentWidget({required this.contentDetails});
  @override
  Widget build(BuildContext context) {
    if (contentDetails?.title?.isNotEmpty ?? false) {
      return GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(BWRoutes.contentDetailPage, arguments: ContentDetails(content: contentDetails!, showReactions: false)),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 50,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                contentDetails!.title!,
                overflow: TextOverflow.ellipsis,
                style:
                    TextThemes.boldSize16Text(Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
