import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_state.dart';
import 'package:ticketeer/features/full_movie/presentation/views/comments_screen/components/comment_block.dart';

/// List view with comments
class CommentsList extends StatelessWidget {
  final String _basePath;

  /// List view with comments
  const CommentsList({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocBuilder<CommentsCubit, GeneralCommentsState>(
      builder: (context, state) {
        if (state is LoadedCommentsState) {
          if (state.comments.isEmpty) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Opacity(
                    opacity: 0.35,
                    child: Image.asset(
                      'assets/comments_placeholder.png',
                    ),
                  ),
                  Opacity(
                    opacity: 0.35,
                    child: Text(
                      "${_basePath}placeholder".tr(),
                      style: roboto.s24.copyWith(
                        color: colors.fonts.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              physics: const BouncingScrollPhysics(),
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                if (index == state.comments.length - 1) {
                  return Column(
                    children: [
                      CommentBlock(
                        commentObj: state.comments[index],
                      ),
                      const SizedBox(
                        height: 140,
                      ),
                    ],
                  );
                }
                return CommentBlock(
                  commentObj: state.comments[index],
                );
              },
            ),
          ).animate().fadeIn(
                duration: const Duration(milliseconds: 300),
              );
        } else {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitDualRing(
                  color: colors.accents.blue,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${_basePath}loading".tr(),
                  style: roboto.s18.copyWith(
                    color: colors.fonts.main,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
