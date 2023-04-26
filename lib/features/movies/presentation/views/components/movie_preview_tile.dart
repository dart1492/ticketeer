import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/movies/domain/entities/movie.dart';

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
        onTap: () {},
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
                      "$parsedCountry, ${movieObj.year}",
                      style: open.s14.copyWith(
                        color: colors.fonts.secondary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.magic_star,
                            fill: 1.0,
                            color: colors.accents.blue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            movieObj.rating,
                            style: open.s16.w700.copyWith(
                              color: colors.fonts.main,
                            ),
                          ),
                        ],
                      ),
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
