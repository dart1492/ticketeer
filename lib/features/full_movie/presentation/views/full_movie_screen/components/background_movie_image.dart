import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Image of the movie
class BackgroundMovieImage extends StatefulWidget {
  /// Image of the movie
  const BackgroundMovieImage({
    required this.trailerLink,
  });

  /// link to the image
  final String trailerLink;

  @override
  State<BackgroundMovieImage> createState() => _BackgroundMovieImageState();
}

class _BackgroundMovieImageState extends State<BackgroundMovieImage> {
  late YoutubePlayerController trailerController;

  @override
  void initState() {
    trailerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.trailerLink) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return YoutubePlayer(
      controller: trailerController,
      progressIndicatorColor: colors.accents.blue,
    );
  }
}
