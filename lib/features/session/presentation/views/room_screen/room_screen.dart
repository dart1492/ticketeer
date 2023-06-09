import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketeer/core/components/buttons/custom_highlighted_button.dart';
import 'package:ticketeer/core/constants/image_names.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_state.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/book_button.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/seat_grid.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/tags_row.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_cubit.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_state.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Room screen where user can pick seats to buy tickets for them
class RoomScreen extends StatelessWidget {
  /// represented session object
  final int sessionId;

  /// represented movie obj
  final Movie movieObj;

  static const _basePath = "screens.room.";

  /// Room screen where user can pick seats to buy tickets for them
  const RoomScreen({
    super.key,
    required this.movieObj,
    required this.sessionId,
  });

  String _parseTime(Session obj) {
    return "${obj.date.hour}:${obj.date.minute}";
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocProvider(
      create: (context) => sl<RoomCubit>()..getSession(sessionId),
      child: BlocListener<RoomCubit, GeneralRoomState>(
        listener: (context, state) {
          if (state is SuccessRoomState) {
            context.router.push(
              PaymentRoute(
                seatIds: state.chosenSeats.map((e) => e.id).toList(),
                sessionId: sessionId,
              ),
            );
          }
        },
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: BlocBuilder<RoomCubit, GeneralRoomState>(
                builder: (context, state) {
                  if (state is LoadedRoomState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movieObj.name,
                          style: roboto.s24.copyWith(
                            color: colors.fonts.main,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.session.room.name,
                              style: roboto.s16.copyWith(
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
                              _parseTime(state.session),
                              style: roboto.s16.copyWith(
                                color: colors.fonts.main,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, state) {
                            if (state is LoadedThemeState) {
                              return Image.asset(
                                state.currentTheme == "dark"
                                    ? ImageNames.screenDark
                                    : ImageNames.screenLight,
                              );
                            }

                            return Image.asset(
                              ImageNames.screenDark,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SeatGrid(sessionObj: state.session),
                        const SizedBox(
                          height: 15,
                        ),
                        TagsRow(
                          sessionObj: state.session,
                          basePath: _basePath,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BookTicketsButton(
                          basePath: _basePath,
                          sessionId: state.session.id,
                        ),
                      ],
                    ).animate().fadeIn(
                          duration: const Duration(milliseconds: 300),
                        );
                  }

                  if (state is ErrorRoomState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "${_basePath}error_loading".tr(),
                              textAlign: TextAlign.center,
                              style: roboto.s18.copyWith(
                                color: colors.accents.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Builder(
                            builder: (context) {
                              return CustomHighlightedButton(
                                width: 150,
                                onTap: () {
                                  context.read<RoomCubit>().getSession(
                                        sessionId,
                                      );
                                },
                                child: Text(
                                  "${_basePath}try_again".tr(),
                                  textAlign: TextAlign.center,
                                  style: roboto.s16.copyWith(
                                    color: colors.fonts.main,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }

                  return SpinKitDualRing(
                    color: colors.accents.blue,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
