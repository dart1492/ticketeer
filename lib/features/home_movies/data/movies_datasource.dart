import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketeer/features/home_movies/data/models/movie_filters_model.dart';
import 'package:ticketeer/features/home_movies/data/models/movie_model.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie_filters.dart';

/// Datasource that interacts with the api
abstract class MoviesDatasource {
  /// get a list of movies based on given parameters
  Future<List<Movie>> getMovies(String searchText, DateTime? date);

  /// Get movie filters
  Future<MovieFilters?> getMovieFilters();

  /// Set movie filters
  Future<void> setMovieFilters(MovieFilters newMovieFilters);
}

/// Implementation of the movies datasource
class MoviesDatasourceImpl extends MoviesDatasource {
  /// Dio object
  final Dio dio;

  /// Shared preferences instance
  final SharedPreferences sp;

  /// Implementation of the movies datasource
  MoviesDatasourceImpl(
    this.dio,
    this.sp,
  );

  String _formatDate(DateTime date) {
    // ignore: lines_longer_than_80_chars
    return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Future<List<Movie>> getMovies(String searchText, DateTime? date) async {
    String formattedDate = "";
    if (date != null) {
      formattedDate = _formatDate(date);
    }

    final result = await dio.get(
      "/api/movies",
      queryParameters: {
        'date': formattedDate,
        'query': searchText,
      },
    );

    // ignore: avoid_dynamic_calls
    final mapList = result.data['data'] as List<dynamic>;
    final List<Movie> returnList = [];
    for (final Map<String, dynamic> map in mapList) {
      returnList.add(MovieModel.fromMap(map));
    }
    return returnList;
  }

  @override
  Future<MovieFilters?> getMovieFilters() async {
    final result = sp.getString("movieFilters");
    if (result == null) {
      return null;
    } else {
      return MovieFiltersModel.fromJson(result);
    }
  }

  @override
  Future<void> setMovieFilters(MovieFilters newMovieFilters) async {
    await sp.setString(
      'movieFilters',
      (newMovieFilters as MovieFiltersModel).toJson(),
    );
  }
}
