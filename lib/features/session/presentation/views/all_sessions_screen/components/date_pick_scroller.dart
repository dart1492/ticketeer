import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_chip.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/core/util/date_time_helper.dart';
import 'package:ticketeer/features/session/presentation/cubits/all_sessions_cubit/all_session_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/all_sessions_cubit/all_sessions_state.dart';

/// Allows user to pick date of the session
class DatePickScroller extends StatelessWidget {
  /// Allows user to pick date of the session
  const DatePickScroller({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocBuilder<AllSessionsCubit, GeneralAllSessionsState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final representedDate = DateTime.now().add(Duration(days: index));
            final String representedDay = representedDate.day.toString();
            final int representedMonth = representedDate.month;

            return Row(
              children: [
                CustomChip(
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
                        DateTimeHelper.monthToShortString(representedMonth)
                            .tr(),
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
      },
    );
  }
}
