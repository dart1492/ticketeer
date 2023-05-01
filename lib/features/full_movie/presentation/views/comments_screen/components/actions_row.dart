import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_state.dart';

/// header row for comments section
class HeaderCommentsRow extends StatelessWidget {
  /// header row for comments section
  const HeaderCommentsRow({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  final String _basePath;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.router.pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: colors.accents.blue,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "${_basePath}header".tr(),
          style: open.s24.w700.copyWith(
            color: colors.fonts.main,
          ),
        ),
        const Expanded(child: SizedBox()),
        BlocBuilder<CommentsCubit, GeneralCommentsState>(
          builder: (context, state) {
            return CustomButton(
              onTap: () {
                context.read<CommentsCubit>().getComments();
              },
              child: Row(
                children: [
                  Text(
                    "${_basePath}refresh".tr(),
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
            );
          },
        ),
      ],
    );
  }
}
