import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';

/// Button that navigates user to the filters screen
class ActionsRow extends StatelessWidget {
  /// Button that navigates user to the filters screen
  const ActionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Builder(
      builder: (context) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.router.push(
                    MovieFiltersRoute(
                      cubit: context.read(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Iconsax.filter,
                      size: 20,
                      color: colors.accents.blue,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "screens.movies-home.filters-button".tr(),
                      style: open.s18.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                context.read<HomeMoviesCubit>().getMovies();
              },
              child: Row(
                children: [
                  Text(
                    "screens.movies-home.refresh-button".tr(),
                    style: open.s16.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 1),
                    child: Icon(
                      Iconsax.refresh,
                      color: colors.accents.blue,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
