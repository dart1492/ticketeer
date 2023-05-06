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
    minYear: 1992,
    maxYear: 2023,
    age: 21,
    savedIndexes: [],
    isShowingSaved: false,
  );

  /// Cubit that is responsible for getting movies -
  /// based on the input of a search field or just first random ones
  HomeMoviesCubit(this.repo)
      : super(
          HomeMoviesState(
            isLoading: false,
            movies: [],
            filteredMovies: [],
            queryText: '',
            queryDate: DateTime.now(),
            movieFilters: _defaultMovieFilters,
            filtersLoadError: false,
            moviesLoadError: false,
          ),
        );

  /// Loading movies feature
  Future<void> getMovies({
    String? queryText,
    DateTime? queryDate,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        moviesLoadError: false,
        filtersLoadError: false,
      ),
    );

    final filterResult = await repo.getMovieFilters();
    MovieFilters appliedFilters = _defaultMovieFilters;

    filterResult.fold(
      (l) {
        emit(
          state.copyWith(
            filtersLoadError: true,
          ),
        );
        emit(
          state.copyWith(
            filtersLoadError: false,
          ),
        );
      },
      (r) {
        if (r != null) {
          appliedFilters = r;
        }
      },
    );

    final moviesResult = await repo.getMovies(
      queryText ?? state.queryText,
      queryDate ?? state.queryDate,
    );

    moviesResult.fold(
      (l) {
        emit(
          state.copyWith(
            moviesLoadError: true,
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            queryDate: queryDate,
            movies: r,
            filteredMovies: _applyMovieFilters(r, appliedFilters),
            movieFilters: appliedFilters,
            isLoading: false,
          ),
        );
      },
    );
  }

  /// Set new filters for movies
  Future<void> updateFilters({
    int? minYear,
    int? maxYear,
    int? age,
    List<int>? savedIndexes,
    bool? isShowingSaved,
  }) async {
    final newFilters = (state.movieFilters as MovieFiltersModel).copyWith(
      minYear: minYear,
      maxYear: maxYear,
      age: age,
      savedIndexes: savedIndexes,
      isShowingSaved: isShowingSaved,
    );
    final result = await repo.setMovieFilters(newFilters);
    result.fold(
      (l) => null,
      (r) => emit(
        state.copyWith(
          movieFilters: newFilters,
          filteredMovies: _applyMovieFilters(state.movies, newFilters),
        ),
      ),
    );
  }

  /// apply additional filtering
  /// for a list of movies that we get from the server.
  List<Movie> _applyMovieFilters(List<Movie> movies, MovieFilters filters) {
    final List<Movie> resultingMovies = [];
    if (filters.isShowingSaved) {
      for (int i = 0; i < movies.length; i++) {
        if (movies[i].year < filters.maxYear &&
            movies[i].year > filters.minYear &&
            movies[i].age < filters.age &&
            filters.savedIndexes.contains(
              movies[i].id,
            )) {
          resultingMovies.add(movies[i]);
        }
      }
    } else {
      for (int i = 0; i < movies.length; i++) {
        if (movies[i].year < filters.maxYear &&
            movies[i].year > filters.minYear &&
            movies[i].age < filters.age) {
          resultingMovies.add(movies[i]);
        }
      }
    }

    return resultingMovies;
  }
}
