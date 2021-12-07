import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class ChewieVideoPlayer extends StatefulWidget {
  const ChewieVideoPlayer({
    Key? key,
    this.autoPlay = false,
    this.chewieController,
  }) : super(key: key);

  final bool autoPlay;
  final Future<ChewieController?>? chewieController;

  @override
  _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChewieController?>(
      future: widget.chewieController,
      builder:
          (BuildContext context, AsyncSnapshot<ChewieController?> snapshot) {
        if (!snapshot.hasData ||
            !snapshot.data!.videoPlayerController.value.isInitialized) {
          return Stack(
            alignment: Alignment.center,
            children: const <Widget>[
              CircularProgressIndicator(color: Colors.white),
            ],
          );
        }
        return Chewie(controller: snapshot.data!);
      },
    );
  }
}
