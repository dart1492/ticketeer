import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketeer/core/components/custom_button.dart';

import 'package:ticketeer/core/components/stacked_gradient.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart';
import 'package:ticketeer/features/session/presentation/cubits/cubit/session_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/cubit/session_state.dart';
import 'package:ticketeer/features/session/presentation/views/components/date_pick_scroller.dart';
import 'package:ticketeer/features/session/presentation/views/components/session_preview_tile.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Screen with available session for the current movie
class SessionScreen extends StatelessWidget {
  /// Passing movie ibj to get the id and (possibly) more needed info
  /// // TODO: Decide if I need an object or just id
  final Movie movieObj;

  static const String _basePath = "screens.all-sessions.";

  /// Screen with available session for the current movie
  const SessionScreen({
    super.key,
    required this.movieObj,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider(
      create: (context) => sl<SessionCubit>()
        ..init(movieObj.id)
        ..getSessions(),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: BlocBuilder<SessionCubit, GeneralSessionState>(
            builder: (context, state) {
              if (state is ErrorSessionState) {
                return CustomButton(
                  child: const Text("Try again"),
                  onTap: () {
                    context.read<SessionCubit>().getSessions();
                  },
                );
              }

              if (state is LoadedSessionState) {
                return Column(
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
                      height: 55,
                      child: DatePickScroller(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemCount: state.sessions.length,
                        itemBuilder: (context, index) => Stack(
                          children: [
                            SessionPreviewTile(
                              basePath: _basePath,
                              sessionObj: state.sessions[index],
                            ),
                            StackedGradient(
                              color: index.isEven
                                  ? colors.accents.blue
                                  : colors.accents.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }

              return SpinKitDualRing(color: colors.accents.blue);
            },
          ),
        ),
      ),
    );
  }
}
