// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie_filters.dart';

/// State when the list of movies is loaded
class HomeMoviesState {
  /// movies list
  final List<Movie> movies;

  final List<Movie> filteredMovies;

  /// Query text
  String queryText;

  /// Query date
  DateTime queryDate;

  /// Indicates that the list of movies is loading
  bool isLoading;

  /// Collection of movie filters to apply to the movies list
  ///
  MovieFilters movieFilters;

  /// State when the list of movies is loaded
  HomeMoviesState({
    required this.movies,
    required this.filteredMovies,
    required this.queryText,
    required this.queryDate,
    required this.isLoading,
    required this.movieFilters,
  });

  HomeMoviesState copyWith({
    List<Movie>? movies,
    List<Movie>? filteredMovies,
    String? queryText,
    DateTime? queryDate,
    bool? isLoading,
    MovieFilters? movieFilters,
  }) {
    return HomeMoviesState(
      movies: movies ?? this.movies,
      filteredMovies: filteredMovies ?? this.filteredMovies,
      queryText: queryText ?? this.queryText,
      queryDate: queryDate ?? this.queryDate,
      isLoading: isLoading ?? this.isLoading,
      movieFilters: movieFilters ?? this.movieFilters,
    );
  }
}
