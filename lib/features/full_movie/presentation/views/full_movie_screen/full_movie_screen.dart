import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ticketeer/core/components/buttons/custom_default_button.dart';
import 'package:ticketeer/core/components/buttons/custom_highlighted_button.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/full_movie/presentation/views/full_movie_screen/components/film_feature_chip.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Screen where user can view full info about the movie
/// and comments, attached to it
@RoutePage()
class FullMovieScreen extends StatefulWidget {
  /// Movie obj, represented in the UI
  final Movie movieObj;

  /// Screen where user can view full info about the movie
  /// and comments, attached to it
  const FullMovieScreen({super.key, required this.movieObj});

  @override
  State<FullMovieScreen> createState() => _FullMovieScreenState();
}

class _FullMovieScreenState extends State<FullMovieScreen> {
  /// Base path for welcome screen localization
  static const _basePath = "screens.full_movie.";

  late YoutubePlayerController _trailerController;

  @override
  void initState() {
    _trailerController = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.movieObj.trailerLink) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _trailerController.dispose();
    super.dispose();
  }

  List<String> _splitSingleStrings(String genresString) {
    return genresString.split(',').map((genre) => genre.trim()).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _trailerController,
        progressIndicatorColor: colors.accents.blue,
      ),
      builder: (context, trailerPlayer) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            scrolledUnderElevation: 0.0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 100,
            leading: GestureDetector(
              onTap: () {
                context.popRoute();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: colors.accents.blue,
                      size: 20,
                    ),
                    Text(
                      "components.app_bar.back".tr(),
                      style: open.s18.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: colors.backgrounds.main,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  trailerPlayer,
                  SizedBox(
                    child: Text(
                      widget.movieObj.name,
                      style: open.s36.w700.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      MovieFeatureChip(
                        text: "${widget.movieObj.age.toString()}+",
                      ),
                      MovieFeatureChip(
                        text: widget.movieObj.year.toString(),
                      ),
                      ...List.generate(
                        _splitSingleStrings(widget.movieObj.country).length,
                        (index) => MovieFeatureChip(
                          text: _splitSingleStrings(
                            widget.movieObj.country,
                          )[index],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      _splitSingleStrings(widget.movieObj.genre).length,
                      (index) => MovieFeatureChip(
                        text: _splitSingleStrings(widget.movieObj.genre)[index],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "${_basePath}rating".tr(),
                        style: open.s18.copyWith(
                          color: colors.fonts.main,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          widget.movieObj.rating,
                          style: open.s18.w700.copyWith(
                            color: colors.fonts.main,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      RatingBarIndicator(
                        unratedColor: colors.backgrounds.secondary,
                        rating: double.parse(widget.movieObj.rating),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: colors.accents.blue,
                        ),
                        itemCount: 5,
                        itemSize: 20,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  Text(
                    widget.movieObj.plotText,
                    textAlign: TextAlign.justify,
                    style: open.s16.copyWith(
                      color: colors.fonts.secondary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_basePath}starring".tr(),
                        style: open.s18.copyWith(
                          color: colors.fonts.main,
                        ),
                      ),
                      ...List.generate(
                        _splitSingleStrings(widget.movieObj.starring).length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            _splitSingleStrings(
                              widget.movieObj.starring,
                            )[index],
                            style: open.s16.copyWith(
                              color: colors.fonts.secondary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${_basePath}director".tr(),
                        style: open.s18.copyWith(
                          color: colors.fonts.main,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.movieObj.director,
                        style: open.s16.copyWith(
                          color: colors.fonts.secondary,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomHighlightedButton(
                        onTap: () {
                          context.router.push(
                            SessionRoute(
                              movieObj: widget.movieObj,
                            ),
                          );
                        },
                        child: Text(
                          "${_basePath}view_sessions".tr(),
                          style: open.s18.copyWith(
                            color: colors.fonts.main,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Builder(
                        builder: (context) {
                          return CustomDefaultButton(
                            onTap: () {
                              context.router.push(
                                CommentsRoute(
                                  movieId: widget.movieObj.id,
                                ),
                              );
                            },
                            child: Text(
                              "${_basePath}read_comments".tr(),
                              style: open.s18.copyWith(
                                color: colors.fonts.main,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
