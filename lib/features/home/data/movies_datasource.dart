import 'package:dio/dio.dart';
import 'package:ticketeer/features/home/data/models/movie_model.dart';
import 'package:ticketeer/features/home/domain/entities/movie.dart';

/// Datasource that interacts with the api
abstract class MoviesDatasource {
  /// get a list of movies based on given parameters
  Future<List<Movie>> getMovies(String searchText, DateTime date);
}

/// Implementation of the movies datasource
class MoviesDatasourceImpl extends MoviesDatasource {
  /// Dio object
  final Dio dio;

  /// Implementation of the movies datasource
  MoviesDatasourceImpl(this.dio);

  String _formatDate(DateTime date) {
    // ignore: lines_longer_than_80_chars
    return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Future<List<Movie>> getMovies(String searchText, DateTime date) async {
    final String formattedDate = _formatDate(date);
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
}
