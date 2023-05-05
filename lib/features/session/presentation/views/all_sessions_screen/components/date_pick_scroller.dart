import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/static_elements/custom_chip.dart';
import 'package:ticketeer/core/constants/string_constants.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/core/util/date_time_helper.dart';
import 'package:ticketeer/features/session/presentation/cubits/all_sessions_cubit/all_session_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/all_sessions_cubit/all_sessions_state.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_cubit.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_state.dart';

/// Allows user to pick date of the session
class DatePickScroller extends StatelessWidget {
  /// Allows user to pick date of the session
  const DatePickScroller({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  final String _basePath;

  Future<void> _selectDate({
    required BuildContext context,
    required AllSessionsCubit cubit,
    required DateTime currentlyChosenDate,
    required DateTime currentDate,
    required AppColorScheme colors,
  }) async {
    final theme =
        (context.read<ThemeCubit>().state as LoadedThemeState).currentTheme;

    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: colors.backgrounds.secondary,
            useMaterial3: true,
            primaryColor: colors.accents.blue,
            colorScheme: theme == darkTheme
                ? ColorScheme.dark(
                    surface: colors.backgrounds.main,
                    onPrimary: colors.fonts.main,
                    primary: colors.accents.blue,
                    background: colors.backgrounds.main,
                    onBackground: colors.fonts.main,
                  )
                : ColorScheme.light(
                    surface: colors.backgrounds.main,
                    onPrimary: colors.fonts.reversed,
                    primary: colors.accents.blue,
                    background: colors.backgrounds.main,
                    onBackground: colors.fonts.main,
                  ),
          ),
          child: child!,
        );
      },
      locale: context.locale,
      context: context,
      initialDate: currentlyChosenDate,
      firstDate: currentDate,
      lastDate: currentDate.add(
        const Duration(days: 60),
      ),
    );

    if (picked != null) {
      unawaited(cubit.getSessionsNewDate(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocBuilder<AllSessionsCubit, GeneralAllSessionsState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            final representedDate = DateTime.now().add(
              Duration(
                days: index - 1,
              ),
            );
            final String representedDay = representedDate.day.toString();
            final int representedMonth = representedDate.month;

            if (index == 0) {
              return CustomChip(
                isSelected: false,
                child: Text(
                  "${_basePath}pick_date".tr(),
                  style: open.s14.copyWith(color: colors.fonts.main),
                ),
                onTap: () => _selectDate(
                  colors: colors,
                  context: context,
                  currentDate: representedDate,
                  currentlyChosenDate: state.chosenDate,
                  cubit: context.read(),
                ),
              );
            }

            return CustomChip(
              onTap: () {
                context.read<AllSessionsCubit>().getSessionsNewDate(
                      representedDate,
                    );
              },
              isSelected: state.chosenDate.day == representedDate.day,
              child: Column(
                children: [
                  Text(
                    representedDay,
                    style: open.s14.copyWith(color: colors.fonts.main),
                  ),
                  Text(
                    DateTimeHelper.monthToShortString(representedMonth).tr(),
                    style: open.s14.copyWith(color: colors.fonts.main),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          scrollDirection: Axis.horizontal,
        );
      },
    );
  }
}
