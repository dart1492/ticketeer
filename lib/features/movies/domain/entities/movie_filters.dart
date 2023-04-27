// ignore_for_file: public_member_api_docs, sort_constructors_first

/// A data class for movie filters. (like years of movies)
class MovieFilters {
  /// Minimal year allowed
  int minYear;

  /// Maximal year allowed
  int maxYear;
  MovieFilters({
    required this.minYear,
    required this.maxYear,
  });
}
