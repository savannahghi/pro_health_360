// Flutter imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:just_audio/just_audio.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/content/widgets/estimated_read_time_badge_widget.dart';
import 'package:myafyahub/presentation/content/widgets/reaction_item.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class AudioContent extends StatefulWidget {
  const AudioContent({
    required this.contentDetails,
  });

  final Content contentDetails;

  @override
  State<AudioContent> createState() => _AudioContentState();
}

class _AudioContentState extends State<AudioContent>
    with WidgetsBindingObserver {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    // Try to load audio from a source
    await _player.setAudioSource(
      AudioSource.uri(
        Uri.parse(
          widget.contentDetails.featuredMedia![0]!.mediaUrl!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: audioControls(_player),
            ),
          ),
          size15HorizontalSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        widget.contentDetails.title ?? UNKNOWN,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextThemes.boldSize16Text(
                          AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    EstimatedReadTimeBadge(
                      contentDetails: widget.contentDetails,
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    if (widget.contentDetails.authorName != null)
                      Text(
                        widget.contentDetails.authorName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextThemes.boldSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                    verySmallHorizontalSizedBox,
                    humanizeDate(
                      dateTextStyle: TextThemes.normalSize12Text(
                        AppColors.greyTextColor,
                      ),
                      loadedDate: widget.contentDetails.metadata?.createdAt ??
                          DateTime.now().toIso8601String(),
                    ),
                  ],
                ),

                // Reactions
                Padding(
                  padding: const EdgeInsets.only(top: 18, bottom: 4),
                  child: Row(
                    children: <Widget>[
                      ReactionItem(
                        iconUrl: heartIconUrl,
                        count: widget.contentDetails.likeCount,
                      ),
                      ReactionItem(
                        iconUrl: shareIconUrl,
                        count: widget.contentDetails.shareCount,
                      ),
                      ReactionItem(
                        iconUrl: saveIconUrl,
                        count: widget.contentDetails.bookmarkCount,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget audioControls(AudioPlayer player) {
  return StreamBuilder<PlayerState>(
    stream: player.playerStateStream,
    builder: (
      BuildContext context,
      AsyncSnapshot<PlayerState> snapshot,
    ) {
      final PlayerState? playerState = snapshot.data;
      final ProcessingState? processingState = playerState?.processingState;
      final bool? playing = playerState?.playing;

      ///Display while loading
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: const BorderRadius.all(Radius.circular(400)),
          ),
          width: 50.0,
          height: 50.0,
          child: const SILPlatformLoader(
            color: Colors.white,
          ),
        );
      } else if (playing != true) {
        ///Display while audio is playing
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: const BorderRadius.all(Radius.circular(400)),
          ),
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.play_arrow),
            iconSize: 50.0,
            onPressed: player.play,
          ),
        );
      } else if (processingState != ProcessingState.completed) {
        ///Display while audio is paused
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: const BorderRadius.all(Radius.circular(400)),
          ),
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.pause),
            iconSize: 50.0,
            onPressed: player.pause,
          ),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: const BorderRadius.all(Radius.circular(400)),
          ),
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.replay),
            iconSize: 50.0,
            onPressed: () => player.seek(Duration.zero),
          ),
        );
      }
    },
  );
}
