import 'package:flutter/material.dart';
import 'package:ticketeer/core/components/custom_chip.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Allows user to pick date of the session
class DatePickScroller extends StatelessWidget {
  /// Allows user to pick date of the session
  const DatePickScroller({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return ListView.builder(
      itemBuilder: (context, index) {
        // final newDay = date.add(Duration(days: index));
        // final String representedDay = newDay.day.toString();
        // final int representedMonth = newDay.month;

        return Row(
          children: [
            CustomChip(
              isSelected: false,
              child: Column(
                children: [
                  Text(
                    14.toString(),
                    style: open.s14.copyWith(color: colors.fonts.main),
                  ),
                  Text(
                    "Apr",
                    style: open.s14.copyWith(color: colors.fonts.main),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
