import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/buttons/custom_highlighted_button.dart';
import 'package:ticketeer/core/components/static_elements/feature_badge.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_state.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_screen/components/movie_preview_shimmer.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_screen/components/movie_preview_tile.dart';

/// List of movies, that gets shown on the screen
class MoviesList extends StatelessWidget {
  final String _basePath;

  /// List of movies, that gets shown on the screen
  const MoviesList({super.key, required String basePath})
      : _basePath = basePath;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    final width = MediaQuery.of(context).size.width / 2;
    return Expanded(
      child: BlocBuilder<HomeMoviesCubit, HomeMoviesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const MoviesListLoader();
          }
          if (state.moviesLoadError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      "${_basePath}error_loading".tr(),
                      textAlign: TextAlign.center,
                      style: open.s18.copyWith(
                        color: colors.accents.red,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomHighlightedButton(
                    width: 150,
                    onTap: () {
                      context.read<HomeMoviesCubit>().getMovies();
                    },
                    child: Text(
                      "${_basePath}try_again".tr(),
                      textAlign: TextAlign.center,
                      style: open.s16.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          if (state.movies.isEmpty) {
            return Center(
              child: Text(
                "${_basePath}no_movies".tr(),
                style: open.s18.copyWith(
                  color: colors.fonts.main,
                ),
              ),
            );
          }

          return CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: width / 460,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return MoviePreview(
                      movieObj: state.filteredMovies[index],
                    ).animate().fadeIn(
                          duration: const Duration(milliseconds: 300),
                        );
                  },
                  childCount: state.filteredMovies.length,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 20,
                    ),
                    FeatureBadge(
                      icon: Icon(
                        Iconsax.info_circle,
                        color: colors.accents.blue,
                      ),
                      text: "${_basePath}info".tr(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
