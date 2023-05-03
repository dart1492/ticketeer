import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_cubit.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/buy_button.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/room_seat.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/tags_row.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Room screen where user can pick seats to buy tickets for them
class RoomScreen extends StatelessWidget {
  /// represented session object
  final Session sessionObj;

  /// represented movie obj
  final Movie movieObj;

  /// Room screen where user can pick seats to buy tickets for them
  const RoomScreen({
    super.key,
    required this.movieObj,
    required this.sessionObj,
  });

  String _parseTime() {
    return "${sessionObj.date.hour}:${sessionObj.date.minute}";
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocProvider(
      create: (context) => sl<RoomCubit>(),
      child: Scaffold(
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
                    "components.app-bar.back".tr(),
                    style: open.s18.copyWith(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Text(
                  movieObj.name,
                  style: open.s24.copyWith(
                    color: colors.fonts.main,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      sessionObj.room.name,
                      style: open.s16.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 20,
                      width: 2,
                      color: colors.accents.blue,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      _parseTime(),
                      style: open.s16.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Screen",
                    style: open.s18.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                ),
                Image.asset('assets/screen.png'),
                const SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < sessionObj.room.rows.length; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (i + 1).toString(),
                              style: open.s14.copyWith(
                                color: colors.fonts.secondary,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            ...List.generate(
                              sessionObj.room.rows[i].seats.length,
                              (index) => RoomSeat(
                                seatObj: sessionObj.room.rows[i].seats[index],
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                const TagsRow(),
                const SizedBox(
                  height: 15,
                ),
                const BuyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
