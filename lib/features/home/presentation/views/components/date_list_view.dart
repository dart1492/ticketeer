import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_chip.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/core/util/date_time_converter.dart';
import 'package:ticketeer/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:ticketeer/features/home/presentation/cubits/cubit/home_state.dart';

/// List of date chips to select date for query
class DateListView extends StatelessWidget {
  /// List of date chips to select date for query
  const DateListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();

    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return SizedBox(
      height: 50,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          // TODO: IMPLEMENT DATE PICKER BUTTON
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 20,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final newDay = date.add(Duration(days: index));
              final String representedDay = newDay.day.toString();
              final int representedMonth = newDay.month;

              final bool isSelected =
                  state.queryDate.day.toString() == representedDay;

              return CustomChip(
                onTap: () {
                  context.read<HomeCubit>().getMoviesDate(newDay);
                },
                isSelected: isSelected,
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
          );
        },
      ),
    );
  }
}
