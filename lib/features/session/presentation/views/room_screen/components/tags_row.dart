import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/room_seat_static.dart';

/// Row with tags
class TagsRow extends StatelessWidget {
  final String _basePath;

  /// Row with tags
  const TagsRow({super.key, required String basePath}) : _basePath = basePath;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            RoomSeatStatic(
              assignedColor: colors.backgrounds.main,
              borderColor: colors.components.blocks.border,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${_basePath}seat_types.taken".tr(),
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ],
        ),
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
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ],
        ),
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
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ],
        ),
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
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ],
        ),
        Column(
          children: [
            RoomSeatStatic(
              assignedColor: colors.accents.green,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${_basePath}seat_types.chosen".tr(),
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
