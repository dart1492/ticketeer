import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';

/// Preview card of the movie with just it's name, rating, year and country
class MoviePreview extends StatelessWidget {
  /// Movie object, represented in this ui
  final Movie movieObj;

  /// Preview card of the movie with just it's name, rating, year and country
  const MoviePreview({
    super.key,
    required this.movieObj,
  });

  /// Parse country value - if there is many countries just save one
  String _getCharactersBeforeFirstComma(String str) {
    final commaIndex = str.indexOf(',');
    if (commaIndex == -1) {
      return str;
    }
    return str.substring(0, commaIndex);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    final String parsedCountry =
        _getCharactersBeforeFirstComma(movieObj.country);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: colors.components.blocks.border,
        splashColor: colors.components.blocks.border,
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          context.router.push(
            FullMovieRoute(movieObj: movieObj),
          );
        },
        child: Ink(
          height: 400,
          child: Column(
            children: [
              Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                  color: colors.components.blocks.border,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      movieObj.smallImageLink,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Text(
                        movieObj.name,
                        style: open.s18.w700.copyWith(
                          color: colors.fonts.main,
                        ),
                      ),
                    ),
                    Text(
                      "$parsedCountry, ${movieObj.year}, ${movieObj.age}+",
                      style: open.s14.copyWith(
                        color: colors.fonts.secondary,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RatingBarIndicator(
                      unratedColor: colors.backgrounds.secondary,
                      rating: double.parse(movieObj.rating),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: colors.accents.blue,
                      ),
                      itemCount: 5,
                      itemSize: 20,
                      direction: Axis.horizontal,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
