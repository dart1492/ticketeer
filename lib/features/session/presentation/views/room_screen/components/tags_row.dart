import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/session/domain/entities/seat.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/room_seat_static.dart';

/// Row with tags
class TagsRow extends StatelessWidget {
  final String _basePath;

  /// session object to find prices of seat types
  final Session sessionObj;

  /// Row with tags
  const TagsRow({
    super.key,
    required String basePath,
    required this.sessionObj,
  }) : _basePath = basePath;

  String? _getSeatPrice(SeatType type) {
    for (final roomRow in sessionObj.room.rows) {
      for (final seat in roomRow.seats) {
        if (seat.type == type) {
          return "${seat.price.toString()} \$";
        }
      }
    }

    return null;
  }

  bool _hasSeatsOfType(SeatType type) {
    for (final roomRow in sessionObj.room.rows) {
      for (final seat in roomRow.seats) {
        if (seat.type == type) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Column(
        //   children: [
        //     RoomSeatStatic(
        //       assignedColor: colors.backgrounds.main,
        //       borderColor: colors.components.blocks.border,
        //     ),
        //     const SizedBox(
        //       height: 5,
        //     ),
        //     Text(
        //       "${_basePath}seat_types.taken".tr(),
        //       style: open.s14.copyWith(
        //         color: colors.fonts.main,
        //       ),
        //     ),
        //   ],
        // ),
        // Column(
        //   children: [
        //     RoomSeatStatic(
        //       assignedColor: colors.accents.green,
        //     ),
        //     const SizedBox(
        //       height: 5,
        //     ),
        //     Text(
        //       "${_basePath}seat_types.chosen".tr(),
        //       style: open.s14.copyWith(
        //         color: colors.fonts.main,
        //       ),
        //     ),
        //   ],
        // ),
        if (_hasSeatsOfType(SeatType.normal))
          Column(
            children: [
              RoomSeatStatic(
                assignedColor: colors.accents.blue,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${_basePath}seat_types.normal".tr(),
                style: roboto.s14.copyWith(
                  color: colors.fonts.main,
                ),
              ),
              Text(
                _getSeatPrice(SeatType.normal) ?? "",
                style: roboto.s14.copyWith(
                  color: colors.fonts.main,
                ),
              ),
            ],
          ),
        if (_hasSeatsOfType(SeatType.better))
          Column(
            children: [
              RoomSeatStatic(
                assignedColor: colors.accents.gold,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${_basePath}seat_types.better".tr(),
                style: roboto.s14.copyWith(
                  color: colors.fonts.main,
                ),
              ),
              Text(
                _getSeatPrice(SeatType.better) ?? "",
                style: roboto.s14.copyWith(
                  color: colors.fonts.main,
                ),
              ),
            ],
          ),
        if (_hasSeatsOfType(SeatType.vip))
          Column(
            children: [
              RoomSeatStatic(
                assignedColor: colors.accents.red,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${_basePath}seat_types.vip".tr(),
                style: roboto.s14.copyWith(
                  color: colors.fonts.main,
                ),
              ),
              Text(
                _getSeatPrice(SeatType.vip) ?? "",
                style: roboto.s14.copyWith(
                  color: colors.fonts.main,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
