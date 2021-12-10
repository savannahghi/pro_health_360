// Flutter imports:

import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
// Package imports:
import 'package:shared_themes/text_themes.dart';

class EstimatedReadTimeBadge extends StatelessWidget {
  const EstimatedReadTimeBadge({
    Key? key,
    required this.contentDetails,
  }) : super(key: key);

  final Content contentDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: AppColors.readTimeBackgroundColor,
      ),
      child: Text(
        contentDetails.contentType! == ContentType.AUDIO_VIDEO
            ? contentAudioVideoDuration(
                contentDetails.featuredMedia?.first?.duration ?? 0,
              )
            : contentReadDuration(contentDetails.estimate ?? 0),
        style: TextThemes.mediumSize14Text(Colors.white).copyWith(fontSize: 12),
      ),
    );
  }
}
