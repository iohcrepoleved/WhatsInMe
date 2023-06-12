import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MusicPlayer extends StatefulWidget {
  final String title, artist, url;
  const MusicPlayer(
      {super.key,
      required this.url,
      required this.title,
      required this.artist});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  late YoutubePlayerController player;

  @override
  void initState() {
    super.initState();
    player = YoutubePlayerController(
        initialVideoId: widget.url.split("/")[3],
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      key: ObjectKey(player),
      controller: player,
      bottomActions: [
        CurrentPosition(),
        const SizedBox(
          width: 10,
        ),
        ProgressBar(
          isExpanded: true,
        ),
        const SizedBox(
          width: 10,
        ),
        RemainingDuration()
      ],
    );
  }
}
