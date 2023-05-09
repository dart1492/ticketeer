import 'package:auto_route/auto_route.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/core/util/date_time_helper.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/room_seat_static.dart';
import 'package:ticketeer/features/user_tickets/domain/entities/ticket.dart';

@RoutePage()

/// Screen with full ticket and bar code for it
class FullTicketScreen extends StatelessWidget {
  /// represented ticket obj
  final Ticket ticketObj;

  static const _baseUrl = "screens.ticket.";

  /// Screen with full ticket and bar code for it
  const FullTicketScreen({
    super.key,
    required this.ticketObj,
  });

  String _parseDate() {
    final String month =
        DateTimeHelper.monthToFullString(ticketObj.date.month).tr();
    return "${ticketObj.date.day.toString()} $month";
  }

  String _parseTime() {
    int hours = ticketObj.date.hour;
    int minutes = ticketObj.date.minute;
    String formattedHours = hours < 10 ? "0$hours" : "$hours";
    String formattedMinutes = minutes < 10 ? "0$minutes" : "$minutes";
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            context.popRoute();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: colors.accents.blue,
                  size: 20,
                ),
                Text(
                  "components.app_bar.back".tr(),
                  style: roboto.s18.copyWith(
                    color: colors.fonts.main,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: colors.backgrounds.main,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(
                    Rect.fromLTRB(
                      0,
                      0,
                      rect.width,
                      rect.height,
                    ),
                  );
                },
                blendMode: BlendMode.dstIn,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(16, 0, 0, 0),
                        Colors.black,
                      ],
                    ).createShader(
                      Rect.fromLTRB(
                        0,
                        0,
                        rect.width,
                        rect.height,
                      ),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.network(
                    ticketObj.imageLink,
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Text(
                          "${_baseUrl}hint".tr(),
                          textAlign: TextAlign.center,
                          style: roboto.s16.w700.copyWith(
                            color: colors.fonts.main,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colors.components.blocks.background,
                          border: Border.all(
                            color: colors.components.blocks.border,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ticketObj.name,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: roboto.s20.w700.copyWith(
                                color: colors.fonts.main,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  height: 20,
                                  width: 1,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _parseSeat(),
                                  style: roboto.s16.copyWith(
                                    color: colors.fonts.main,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoomSeatStatic(
                                  assignedColor: colors.accents.blue,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BarcodeWidget(
                              style: roboto.s10.copyWith(
                                color: colors.components.blocks.background,
                              ),
                              color: colors.fonts.main,
                              height: 70,
                              width: 150,
                              data: ticketObj.id.toString(),
                              barcode: Barcode.codabar(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
