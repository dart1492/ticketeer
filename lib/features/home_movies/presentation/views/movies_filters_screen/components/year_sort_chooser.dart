// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_state.dart';

/// Allows user to choose between ascending and descending sort by year
class YearChooser extends StatelessWidget {
  final TextEditingController minYearController;
  final TextEditingController maxYearController;
  final String basePath;

  /// Allows user to choose between ascending and descending sort by year
  const YearChooser({
    Key? key,
    required this.minYearController,
    required this.maxYearController,
    required this.basePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocBuilder<HomeMoviesCubit, HomeMoviesState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                "${basePath}year".tr(),
                style: roboto.s18.copyWith(
                  color: colors.fonts.main,
                ),
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: 60,
                child: CustomTextField(
                  charLimit: 4,
                  keyboardType: TextInputType.number,
                  controller: minYearController,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${basePath}to".tr(),
                style: roboto.s18.copyWith(
                  color: colors.fonts.main,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 60,
                child: CustomTextField(
                  charLimit: 4,
                  keyboardType: TextInputType.number,
                  controller: maxYearController,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
