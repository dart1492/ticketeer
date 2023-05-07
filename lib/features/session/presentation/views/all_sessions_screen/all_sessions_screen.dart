import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketeer/core/components/buttons/custom_highlighted_button.dart';
import 'package:ticketeer/core/components/static_elements/stacked_gradient.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';
import 'package:ticketeer/features/session/presentation/cubits/all_sessions_cubit/all_session_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/all_sessions_cubit/all_sessions_state.dart';
import 'package:ticketeer/features/session/presentation/views/all_sessions_screen/components/date_pick_scroller.dart';
import 'package:ticketeer/features/session/presentation/views/all_sessions_screen/components/session_preview_tile.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Screen with available session for the current movie
class SessionScreen extends StatelessWidget {
  /// Passing movie i=obj to get the id and name
  final Movie movieObj;

  static const String _basePath = "screens.all-sessions.";

  /// Screen with available session for the current movie
  const SessionScreen({
    super.key,
    required this.movieObj,
  });

  List<Session> _filterSessionsAheadOfCurrent(
    List<Session> sessions,
    DateTime now,
  ) {
    final List<Session> aheadSessions = [];
    for (final Session session in sessions) {
      if (session.date.isAfter(now)) {
        aheadSessions.add(session);
      }
    }
    return aheadSessions;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider(
      create: (context) => sl<AllSessionsCubit>()..init(movieObj.id),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_basePath}header".tr(),
                style: open.s24.copyWith(color: colors.fonts.main),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 56,
                child: DatePickScroller(
                  basePath: _basePath,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: BlocBuilder<AllSessionsCubit, GeneralAllSessionsState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return SpinKitDualRing(color: colors.accents.blue);
                    }

                    if (state.isError) {
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
                                style: open.s18.copyWith(
                                  color: colors.accents.red,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomHighlightedButton(
                              width: 150,
                              onTap: () {
                                context
                                    .read<AllSessionsCubit>()
                                    .getSessionsNewDate(
                                      state.chosenDate,
                                    );
                              },
                              child: Text(
                                "${_basePath}try_again".tr(),
                                textAlign: TextAlign.center,
                                style: open.s16.copyWith(
                                  color: colors.fonts.main,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    // Filter out those sessions on the same day that are past
                    // current time
                    final DateTime now = DateTime.now();
                    List<Session> sessionList = [];
                    if (now.day == state.chosenDate.day) {
                      sessionList = _filterSessionsAheadOfCurrent(
                        state.sessions,
                        now,
                      );
                    } else {
                      sessionList = state.sessions;
                    }

                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: sessionList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Stack(
                            children: [
                              SessionPreviewTile(
                                onTap: () {
                                  context.router.push(
                                    RoomRoute(
                                      sessionId: sessionList[index].id,
                                      movieObj: movieObj,
                                    ),
                                  );
                                },
                                basePath: _basePath,
                                movieObj: movieObj,
                                sessionObj: sessionList[index],
                              ),
                              StackedGradient(
                                color: index.isEven
                                    ? colors.accents.blue
                                    : colors.accents.red,
                              )
                            ],
                          ).animate().fadeIn(
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                              ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
