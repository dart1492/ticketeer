import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/components/buttons/custom_default_button.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';

/// Tile that gives user general info about the session
class SessionPreviewTile extends StatelessWidget {
  /// represented session object
  final Session sessionObj;

  /// represented movie obj
  final Movie movieObj;

  final String _basePath;

  /// on tap effect
  final Function() onTap;

  /// Tile that gives user general info about the session
  const SessionPreviewTile({
    super.key,
    required this.sessionObj,
    required this.movieObj,
    required this.onTap,
    required String basePath,
  }) : _basePath = basePath;

  String _parseTime() {
    return "${sessionObj.date.hour}:${sessionObj.date.minute}";
  }

  String _room() {
    final String staticTranslated = "${_basePath}room".tr();
    return "${sessionObj.room.name} $staticTranslated";
  }

  String _seatsNumber() {
    int seatsTotal = 0;
    int seatsAvailable = 0;
    for (int i = 0; i < sessionObj.room.rows.length; i++) {
      final row = sessionObj.room.rows[i];
      for (int j = 0; j < row.seats.length; j++) {
        if (row.seats[j].isAvailable) {
          seatsAvailable++;
        }
        seatsTotal++;
      }
    }
    final String staticTranslated = "${_basePath}seats".tr();
    return "$staticTranslated $seatsAvailable / $seatsTotal";
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return CustomDefaultButton(
      onTap: onTap,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sessionObj.type,
                style: open.s24.w700.copyWith(
                  color: colors.accents.blue,
                ),
              ),
              Text(
                "${_basePath}starting-from".tr(),
                style: open.s16.copyWith(
                  color: colors.fonts.main,
                ),
              ),
              Text(
                "${sessionObj.minPrice} \$",
                style: open.s16.copyWith(
                  color: colors.fonts.main,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    _parseTime(),
                    style: open.s18.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                ],
              ),
              Text(
                _room(),
                style: open.s16.copyWith(
                  color: colors.fonts.main,
                ),
              ),
              Text(
                _seatsNumber(),
                style: open.s16.copyWith(
                  color: colors.fonts.main,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
