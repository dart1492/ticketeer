import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_state.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_screen/components/movie_preview_shimmer.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_screen/components/movie_preview_tile.dart';

/// List of movies, that gets shown on the screen
class MoviesList extends StatelessWidget {
  /// List of movies, that gets shown on the screen
  const MoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    final width = MediaQuery.of(context).size.width / 2;
    return Expanded(
      child: BlocBuilder<HomeMoviesCubit, HomeMoviesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const MoviesListLoader();
          } else if (state.movies.isEmpty) {
            return Center(
              child: Text(
                "No movies...",
                style: open.s18.copyWith(
                  color: colors.fonts.main,
                ),
              ),
            );
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: width / 460,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return MoviePreview(
                  movieObj: state.movies[index],
                ).animate().fadeIn(
                      duration: const Duration(milliseconds: 300),
                    );
              },
            );
          }
        },
      ),
    );
  }
}
