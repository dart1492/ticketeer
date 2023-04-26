// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  int id;
  String name;
  int age;
  String trailerLink;
  String imageLink;
  String smallImageLink;
  String originalName;

  /// Duration in minutes
  int duration;
  String language;
  String rating;
  int year;
  String country;
  String genre;
  String plotText;
  String starring;
  String director;
  String screenWriter;
  String studio;
  Movie({
    required this.id,
    required this.name,
    required this.age,
    required this.trailerLink,
    required this.imageLink,
    required this.smallImageLink,
    required this.originalName,
    required this.duration,
    required this.language,
    required this.rating,
    required this.year,
    required this.country,
    required this.genre,
    required this.plotText,
    required this.starring,
    required this.director,
    required this.screenWriter,
    required this.studio,
  });
}
