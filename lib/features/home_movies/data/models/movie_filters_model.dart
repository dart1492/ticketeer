import 'dart:convert';

import 'package:ticketeer/features/home_movies/domain/entities/movie_filters.dart';

/// Concrete implementation of movie filters class
class MovieFiltersModel extends MovieFilters {
  /// Concrete implementation of movie filters class
  MovieFiltersModel({
    required super.maxYear,
    required super.minYear,
    required super.age,
  });

  /// Copy with constructor
  MovieFiltersModel copyWith({
    int? minYear,
    int? maxYear,
    int? age,
  }) {
    return MovieFiltersModel(
      minYear: minYear ?? this.minYear,
      maxYear: maxYear ?? this.maxYear,
      age: age ?? this.age,
    );
  }

  /// To map conversion
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'minYear': minYear,
      'maxYear': maxYear,
      'age': age,
    };
  }

  ///  from map conversion
  factory MovieFiltersModel.fromMap(Map<String, dynamic> map) {
    return MovieFiltersModel(
      minYear: map['minYear'] as int,
      maxYear: map['maxYear'] as int,
      age: map['age'] as int,
    );
  }

  /// Converts map to json string
  String toJson() => json.encode(toMap());

  /// Converts from json string to object
  factory MovieFiltersModel.fromJson(String source) =>
      MovieFiltersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MovieFilters(minYear: $minYear, maxYear: $maxYear)';
}
