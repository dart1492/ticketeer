// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ticketeer/features/movies/domain/entities/movie.dart';

/// State when the list of movies is loaded
class HomeMoviesState {
  /// movies list
  final List<Movie> movies;

  /// Query text
  String queryText;

  /// Query date
  DateTime queryDate;

  /// Indicates that the list of movies is loading
  bool isLoading;

  /// State when the list of movies is loaded
  HomeMoviesState({
    required this.movies,
    required this.queryText,
    required this.queryDate,
    required this.isLoading,
  });

  HomeMoviesState copyWith({
    List<Movie>? movies,
    String? queryText,
    DateTime? queryDate,
    bool? isLoading,
  }) {
    return HomeMoviesState(
      movies: movies ?? this.movies,
      queryText: queryText ?? this.queryText,
      queryDate: queryDate ?? this.queryDate,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
