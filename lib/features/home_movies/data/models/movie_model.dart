// ignore_for_file: public_member_api_docs

import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';

/// COncrete implementation of the Movie
class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.name,
    required super.age,
    required super.trailerLink,
    required super.imageLink,
    required super.smallImageLink,
    required super.originalName,
    required super.duration,
    required super.language,
    required super.rating,
    required super.year,
    required super.country,
    required super.genre,
    required super.plotText,
    required super.starring,
    required super.director,
    required super.screenWriter,
    required super.studio,
  });

  MovieModel copyWith({
    int? id,
    String? name,
    int? age,
    String? trailerLink,
    String? imageLink,
    String? smallImageLink,
    String? originalName,
    int? duration,
    String? language,
    String? rating,
    int? year,
    String? country,
    String? genre,
    String? plotText,
    String? starring,
    String? director,
    String? screenWriter,
    String? studio,
  }) {
    return MovieModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      trailerLink: trailerLink ?? this.trailerLink,
      imageLink: imageLink ?? this.imageLink,
      smallImageLink: smallImageLink ?? this.smallImageLink,
      originalName: originalName ?? this.originalName,
      duration: duration ?? this.duration,
      language: language ?? this.language,
      rating: rating ?? this.rating,
      year: year ?? this.year,
      country: country ?? this.country,
      genre: genre ?? this.genre,
      plotText: plotText ?? this.plotText,
      starring: starring ?? this.starring,
      director: director ?? this.director,
      screenWriter: screenWriter ?? this.screenWriter,
      studio: studio ?? this.studio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'trailerLink': trailerLink,
      'imageLink': imageLink,
      'smallImageLink': smallImageLink,
      'originalName': originalName,
      'duration': duration,
      'language': language,
      'rating': rating,
      'year': year,
      'country': country,
      'genre': genre,
      'plotText': plotText,
      'starring': starring,
      'director': director,
      'screenWriter': screenWriter,
      'studio': studio,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int,
      name: map['name'] as String? ?? "defaultName",
      age: map['age'] as int? ?? 18,
      trailerLink: map['trailer'] as String? ?? "defaultLink",
      imageLink: map['image'] as String? ?? "defaultLink",
      smallImageLink: map['smallImage'] as String? ?? "defaultLink",
      originalName: map['originalName'] as String? ??
          map['name'] as String? ??
          "defaultName",
      duration: map['duration'] as int? ?? 100,
      language: map['language'] as String? ?? "defaultLanguage",
      rating: map['rating'] as String? ?? "0.0",
      year: map['year'] as int? ?? 2023,
      country: map['country'] as String? ?? "",
      genre: map['genre'] as String? ?? "",
      plotText: map['plot'] as String? ?? "",
      starring: map['starring'] as String? ?? "",
      director: map['director'] as String? ?? "",
      screenWriter: map['screenWriter'] as String? ?? "",
      studio: map['studio'] as String? ?? "",
    );
  }
}
