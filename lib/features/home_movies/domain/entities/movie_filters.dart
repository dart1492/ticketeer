import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
/// A data class for movie filters. (like years of movies)
class MovieFilters {
  /// Minimal year allowed
  int minYear;

  /// Maximal year allowed
  int maxYear;

  int age;

  List<int> savedIndexes;

  bool isShowingSaved;

  MovieFilters({
    required this.minYear,
    required this.maxYear,
    required this.age,
    required this.savedIndexes,
    required this.isShowingSaved,
  });

  @override
  bool operator ==(covariant MovieFilters other) {
    if (identical(this, other)) return true;

    return other.minYear == minYear &&
        other.maxYear == maxYear &&
        other.age == age &&
        listEquals(other.savedIndexes, savedIndexes) &&
        other.isShowingSaved == isShowingSaved;
  }

  @override
  int get hashCode {
    return minYear.hashCode ^
        maxYear.hashCode ^
        age.hashCode ^
        savedIndexes.hashCode ^
        isShowingSaved.hashCode;
  }
}
