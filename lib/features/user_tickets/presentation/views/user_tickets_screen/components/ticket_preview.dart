import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/core/util/date_time_helper.dart';
import 'package:ticketeer/features/user_tickets/domain/entities/ticket.dart';

/// Ticket preview with main movie image, it's name and date of the session
class TicketPreview extends StatelessWidget {
  /// Ticket object, represented in the UI
  final Ticket ticketObj;

  static const _baseUrl = "screens.ticket.";

  /// Ticket preview with main movie image, it's name and date of the session
  const TicketPreview({
    super.key,
    required this.ticketObj,
  });

  String _parseDate() {
    final String month =
        DateTimeHelper.monthToFullString(ticketObj.date.month).tr();
    return "${ticketObj.date.day.toString()} $month";
  }

  String _parseTime() {
    final int hours = ticketObj.date.hour;
    final int minutes = ticketObj.date.minute;
    final String formattedHours = hours < 10 ? "0$hours" : "$hours";
    final String formattedMinutes = minutes < 10 ? "0$minutes" : "$minutes";
    // ignore: lines_longer_than_80_chars
    return "$formattedHours:$formattedMinutes";
  }

  String _parseSeat() {
    final String seat = "${_baseUrl}seat".tr();
    final String row = "${_baseUrl}row".tr();
    return "$seat ${ticketObj.seatIndex}, $row ${ticketObj.rowIndex}";
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return CustomButton(
      onTap: () {
        context.router.push(
          FullTicketRoute(
            ticketObj: ticketObj,
          ),
        );
      },
      color: colors.components.blocks.background,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      border: Border.all(
        color: colors.components.blocks.border,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticketObj.name,
                  style: roboto.s18.copyWith(
                    color: colors.fonts.main,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _parseDate(),
                      style: roboto.s16.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 15,
                      width: 2,
                      color: colors.accents.blue,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      _parseTime(),
                      style: roboto.s16.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                  ],
                ),
                Text(
                  _parseSeat(),
                  style: roboto.s16.copyWith(
                    color: colors.fonts.main,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 90,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    ticketObj.imageLink,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
