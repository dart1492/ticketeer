import 'dart:convert';

import 'package:ticketeer/features/home_movies/domain/entities/movie_filters.dart';

/// Concrete implementation of movie filters class
class MovieFiltersModel extends MovieFilters {
  /// Concrete implementation of movie filters class
  MovieFiltersModel({
    required super.maxYear,
    required super.minYear,
    required super.age,
    required super.savedIndexes,
    required super.isShowingSaved,
  });

  /// copy with
  MovieFiltersModel copyWith({
    int? minYear,
    int? maxYear,
    int? age,
    List<int>? savedIndexes,
    bool? isShowingSaved,
  }) {
    return MovieFiltersModel(
      minYear: minYear ?? this.minYear,
      maxYear: maxYear ?? this.maxYear,
      age: age ?? this.age,
      savedIndexes: savedIndexes ?? this.savedIndexes,
      isShowingSaved: isShowingSaved ?? this.isShowingSaved,
    );
  }

  /// to map conversion
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'minYear': minYear,
      'maxYear': maxYear,
      'age': age,
      'savedIndexes': savedIndexes,
      'isShowingSaved': isShowingSaved,
    };
  }

  /// From map conversion
  factory MovieFiltersModel.fromMap(Map<String, dynamic> map) {
    final List<dynamic> savedIndexesDynamic =
        map['savedIndexes'] as List<dynamic>;
    final List<int> savedIndexes = [];
    for (int i = 0; i < savedIndexesDynamic.length; i++) {
      savedIndexes.add(savedIndexesDynamic[i] as int);
    }
    return MovieFiltersModel(
      minYear: map['minYear'] as int,
      maxYear: map['maxYear'] as int,
      age: map['age'] as int,
      isShowingSaved: map['isShowingSaved'] as bool,
      savedIndexes: savedIndexes,
    );
  }

  /// to json string
  String toJson() => json.encode(toMap());

  /// from json string
  factory MovieFiltersModel.fromJson(String source) =>
      MovieFiltersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
