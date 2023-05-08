import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/components/custom_toasts.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_state.dart';
import 'package:ticketeer/features/full_movie/presentation/views/comments_screen/components/comment_write.dart';
import 'package:ticketeer/features/full_movie/presentation/views/comments_screen/components/comments_list.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Comment section for a full movie
class CommentsScreen extends StatelessWidget {
  /// Id of the currently viewed movie
  final int movieId;

  static const String _basePath = "screens.comments.";

  /// Comment section for a full movie
  const CommentsScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider(
      create: (context) => sl<CommentsCubit>()
        ..init(movieId)
        ..getComments(),
      child: BlocListener<CommentsCubit, GeneralCommentsState>(
        listener: (context, state) {
          if (state is ErrorCommentsState) {
            showErrorToast(text: state.errorText, colors: colors);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
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
              const SizedBox(
                width: 15,
              ),
            ],
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
                      "components.app_bar.back".tr(),
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
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      //HeaderCommentsRow(basePath: _basePath),
                      SizedBox(
                        height: 10,
                      ),
                      CommentsList(
                        basePath: _basePath,
                      ),
                    ],
                  ),
                ),
                CommentWrite(
                  movieId: movieId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
