import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/components/custom_toasts.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/cubit/movie_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/cubit/movie_state.dart';
import 'package:ticketeer/features/full_movie/presentation/views/comments_screen/components/comment_block.dart';
import 'package:ticketeer/features/full_movie/presentation/views/comments_screen/components/comment_write.dart';

@RoutePage()

/// Comment section for a full movie
class CommentsScreen extends StatelessWidget {
  /// Cubit to manage comments
  final MovieCubit cubit;

  /// Id of the currently viewed movie
  final int movieId;

  /// Comment section for a full movie
  const CommentsScreen({
    super.key,
    required this.cubit,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider.value(
      value: cubit..getComments(movieId),
      child: BlocListener<MovieCubit, MovieState>(
        listener: (context, state) {
          if (state.errorText != null) {
            showErrorToast(text: state.errorText!, colors: colors);
          }
        },
        child: Scaffold(
          backgroundColor: colors.backgrounds.main,
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                            "Comments:",
                            style: open.s24.w700.copyWith(
                              color: colors.fonts.main,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Builder(
                            builder: (context) {
                              return CustomButton(
                                onTap: () {
                                  context
                                      .read<MovieCubit>()
                                      .getComments(movieId);
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
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<MovieCubit, MovieState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
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
                        },
                      ),
                    ],
                  ),
                ),
                const CommentWrite(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
