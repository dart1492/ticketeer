import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Button that navigates user to the filters screen
class FiltersButton extends StatelessWidget {
  /// Button that navigates user to the filters screen
  const FiltersButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Builder(
      builder: (context) {
        return CustomButton(
          onTap: () {
            context.router.push(
              MovieFiltersRoute(
                cubit: context.read(),
              ),
            );
          },
          width: 110,
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
                "Filters",
                style: open.s18.copyWith(
                  color: colors.fonts.main,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
