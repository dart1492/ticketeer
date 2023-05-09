import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ticketeer/core/components/custom_toasts.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comment_write_cubit/comment_write_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comment_write_cubit/comment_write_state.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_cubit.dart';
import 'package:ticketeer/locator.dart';

/// Widget with the textfield and a rating builder
class CommentWrite extends StatefulWidget {
  /// Id of the movie for comments
  final int movieId;

  /// Widget with the textfield and a rating builder
  const CommentWrite({
    super.key,
    required this.movieId,
  });

  @override
  State<CommentWrite> createState() => _CommentWriteState();
}

class _CommentWriteState extends State<CommentWrite> {
  static const String _basePath = "screens.comments.";
  TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void activeSendAction() {
    context.read<CommentWriteCubit>().postComment();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocProvider(
      create: (context) => sl<CommentWriteCubit>()..init(widget.movieId),
      child: BlocListener<CommentWriteCubit, GeneralCommentWriteState>(
        listener: (context, state) {
          if (state is SuccessWritingCommentState) {
            context.read<CommentsCubit>().getComments();
            commentController.clear();
            showSuccessToast(text: "${_basePath}success".tr(), colors: colors);
          }

          if (state is ErrorWritingCommentState) {
            showErrorToast(text: state.errorMessage, colors: colors);
          }
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: colors.backgrounds.main,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 130,
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<CommentWriteCubit, GeneralCommentWriteState>(
                        builder: (context, state) {
                          double rating = 0.0;
                          if (state is CreatingCommentWriteState) {
                            rating = state.rating;
                          }
                          return RatingBar.builder(
                            glowColor: colors.accents.blue.withOpacity(0.3),
                            unratedColor: colors.fonts.secondary,
                            itemSize: 25,
                            initialRating: rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.only(right: 5),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: colors.accents.blue,
                              size: 15,
                            ),
                            onRatingUpdate: (rating) {
                              context
                                  .read<CommentWriteCubit>()
                                  .updateRating(rating);
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 80,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Builder(
                                builder: (context) {
                                  return TextField(
                                    controller: commentController,
                                    textInputAction: TextInputAction.newline,
                                    onChanged: (value) {
                                      context
                                          .read<CommentWriteCubit>()
                                          .updateCommentText(value);
                                    },
                                    style: roboto.s14.copyWith(
                                      color: colors.fonts.main,
                                    ),
                                    maxLines: null,
                                    cursorColor: colors.accents.blue,
                                    decoration: InputDecoration(
                                      labelStyle: roboto.s14.copyWith(
                                        color: colors.fonts.secondary,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                        borderSide: BorderSide(
                                          color:
                                              colors.components.blocks.border,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                        borderSide: BorderSide(
                                          color: colors.accents.blue,
                                        ),
                                      ),
                                      labelText: "${_basePath}label".tr(),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: BlocBuilder<CommentWriteCubit,
                                  GeneralCommentWriteState>(
                                builder: (context, state) {
                                  bool activeStatus = false;

                                  if (state is CreatingCommentWriteState) {
                                    if (state.commentText.isNotEmpty &&
                                        state.rating != 0.0) {
                                      activeStatus = true;
                                    }
                                  }

                                  return GestureDetector(
                                    onTap: activeStatus
                                        ? () {
                                            context
                                                .read<CommentWriteCubit>()
                                                .postComment();
                                          }
                                        : null,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.send,
                                        color: !activeStatus
                                            ? colors.fonts.secondary
                                            : colors.accents.blue,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
