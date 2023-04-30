import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/cubit/movie_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/views/full_movie_screen/components/background_movie_image.dart';
import 'package:ticketeer/features/full_movie/presentation/views/full_movie_screen/components/film_feature_chip.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:ticketeer/locator.dart';

/// Screen where user can view full info about the movie
/// and comments, attached to it
@RoutePage()
class FullMovieScreen extends StatelessWidget {
  /// Movie obj, represented in the UI
  final Movie movieObj;

  /// Screen where user can view full info about the movie
  /// and comments, attached to it
  const FullMovieScreen({super.key, required this.movieObj});

  /// Base path for welcome screen localization
  static const _basePath = "screens.full-movie.";

  List<String> _splitSingleStrings(String genresString) {
    return genresString.split(',').map((genre) => genre.trim()).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocProvider(
      create: (context) => sl<MovieCubit>()..getComments(movieObj.id),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colors.backgrounds.secondary,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              context.popRoute();
            },
            child: Icon(
              Iconsax.backward,
              color: colors.accents.blue,
              size: 30,
            ),
          ),
        ),
        backgroundColor: colors.backgrounds.main,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    BackgroundMovieImage(
                      trailerLink: movieObj.trailerLink,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        movieObj.name,
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
                          text: "${movieObj.age.toString()}+",
                        ),
                        MovieFeatureChip(
                          text: movieObj.year.toString(),
                        ),
                        MovieFeatureChip(
                          text: movieObj.country,
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
                        _splitSingleStrings(movieObj.genre).length,
                        (index) => MovieFeatureChip(
                          text: _splitSingleStrings(movieObj.genre)[index],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Row(
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
                              movieObj.rating,
                              style: open.s18.w700.copyWith(
                                color: colors.fonts.main,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Icon(
                              Iconsax.magic_star,
                              color: colors.accents.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        movieObj.plotText,
                        textAlign: TextAlign.justify,
                        style: open.s16.copyWith(
                          color: colors.fonts.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                          _splitSingleStrings(movieObj.starring).length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              _splitSingleStrings(movieObj.starring)[index],
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
                          movieObj.director,
                          style: open.s16.copyWith(
                            color: colors.fonts.secondary,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          child: Text(
                            "View available sessions",
                            style: open.s18.copyWith(
                              color: colors.fonts.main,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Or",
                          style: open.s16.copyWith(
                            color: colors.fonts.secondary,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Builder(
                          builder: (context) {
                            return CustomButton(
                              onTap: () {
                                context.router.push(
                                  CommentsRoute(
                                    cubit: BlocProvider.of(context),
                                    movieId: movieObj.id,
                                  ),
                                );
                              },
                              child: Text(
                                "Read comments",
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
            ],
          ),
        ),
      ),
    );
  }
}
