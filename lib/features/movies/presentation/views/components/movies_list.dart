import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/features/movies/presentation/cubits/home_movies_cubit/home_movies_state.dart';
import 'package:ticketeer/features/movies/presentation/views/components/movie_preview_shimmer.dart';
import 'package:ticketeer/features/movies/presentation/views/components/movie_preview_tile.dart';

/// List of movies, that gets shown on the screen
class MoviesList extends StatelessWidget {
  /// List of movies, that gets shown on the screen
  const MoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2;
    return Expanded(
      child: BlocBuilder<HomeMoviesCubit, HomeMoviesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const MoviesListLoader();
          } else if (state.movies.isEmpty) {
            return const Text("No movies...");
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: width / 440,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return MoviePreview(
                  movieObj: state.movies[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
