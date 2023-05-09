import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Button that navigates user to the filters screen
class ActionsRow extends StatelessWidget {
  final String _basePath;

  /// Button that navigates user to the filters screen
  const ActionsRow({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

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
                      "${_basePath}filters_button".tr(),
                      style: roboto.s18.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
