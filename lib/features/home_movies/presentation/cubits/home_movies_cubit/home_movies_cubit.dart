import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/home_movies/data/models/movie_filters_model.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie_filters.dart';
import 'package:ticketeer/features/home_movies/domain/repositories/movies_repository.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_state.dart';

/// Cubit that is responsible for getting movies -
/// based on the input of a search field or just first random ones
class HomeMoviesCubit extends Cubit<HomeMoviesState> {
  /// Movies repository
  final MoviesRepository repo;

  /// Default movie filters instance
  static final _defaultMovieFilters = MovieFiltersModel(
    minYear: 2005,
    maxYear: 2023,
    age: 15,
  );

  /// Cubit that is responsible for getting movies -
  /// based on the input of a search field or just first random ones
  HomeMoviesCubit(this.repo)
      : super(
          HomeMoviesState(
            isLoading: false,
            movies: [],
            queryText: '',
            queryDate: DateTime.now(),
            movieFilters: _defaultMovieFilters,
          ),
        );

  /// Loading movies feature
  Future<void> getMovies({
    String? queryText,
    DateTime? queryDate,
    MovieFilters? movieFilters,
  }) async {
    emit(state.copyWith(isLoading: true));

    if (movieFilters != null) {
      await repo.setMovieFilters(movieFilters);
    }

    final filtersResult = await repo.getMovieFilters();

    MovieFilters appliedMovieFilters = _defaultMovieFilters;

    filtersResult.fold(
      (l) => null,
      (r) {
        if (r == null) {
          repo.setMovieFilters(
            appliedMovieFilters,
          );
        } else {
          appliedMovieFilters = r;
        }
      },
    );

    final moviesResult = await repo.getMovies(
      queryText ?? state.queryText,
      queryDate ?? state.queryDate,
    );

    moviesResult.fold(
      (l) => null, // TODO: IMPLEMENT ERROR HANDLING
      (r) {
        emit(
          state.copyWith(
            movieFilters: appliedMovieFilters,
            queryDate: queryDate,
            movies: _applyMovieFilters(r, appliedMovieFilters),
            isLoading: false,
          ),
        );
      },
    );
  }

  /// apply additional filtering
  /// for a list of movies that we get from the server.
  List<Movie> _applyMovieFilters(List<Movie> movies, MovieFilters filters) {
    // movies.forEach((element) {
    //   print(element.year);
    // });
    final List<Movie> resultingMovies = [];
    for (int i = 0; i < movies.length; i++) {
      if (movies[i].year < filters.maxYear &&
          movies[i].year > filters.minYear &&
          movies[i].age < filters.age) {
        resultingMovies.add(movies[i]);
      }
    }

    return resultingMovies;
  }
}
