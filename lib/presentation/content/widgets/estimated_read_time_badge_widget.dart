// Flutter imports:

// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class EstimatedReadTimeBadge extends StatelessWidget {
  const EstimatedReadTimeBadge({
    Key? key,
    required this.contentType,
    required this.estimateReadTime,
    this.isAudio = false,
  }) : super(key: key);

  final ContentType contentType;
  final int estimateReadTime;
  final bool isAudio;

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
        contentType == ContentType.AUDIO_VIDEO && isAudio
            ? audioTime(estimateReadTime)
            : contentType == ContentType.AUDIO_VIDEO
                ? contentAudioVideoDuration(
                    estimateReadTime,
                  )
                : contentReadDuration(estimateReadTime),
        style: TextThemes.mediumSize14Text(Colors.white).copyWith(fontSize: 12),
      ),
    );
  }
}
