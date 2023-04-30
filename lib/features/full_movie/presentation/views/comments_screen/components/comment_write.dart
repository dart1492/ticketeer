import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/full_movie/data/models/post_comment_model.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/cubit/movie_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/cubit/movie_state.dart';

/// Widget with the textfield and a rating builder
class CommentWrite extends StatefulWidget {
  /// Widget with the textfield and a rating builder
  const CommentWrite({
    super.key,
  });

  @override
  State<CommentWrite> createState() => _CommentWriteState();
}

class _CommentWriteState extends State<CommentWrite> {
  TextEditingController commentTextFieldController = TextEditingController();
  double currentRating = 0.0;

  String commentText = '';

  @override
  void initState() {
    commentTextFieldController.addListener(() {
      setState(() {
        commentText = commentTextFieldController.value.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    commentTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Align(
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
                  RatingBar.builder(
                    unratedColor: colors.backgrounds.secondary,
                    itemSize: 25,
                    initialRating: currentRating,
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
                      setState(
                        () {
                          currentRating = rating;
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
                          child: TextField(
                            textInputAction: TextInputAction.newline,
                            onChanged: (value) {},
                            controller: commentTextFieldController,
                            style: open.s14.copyWith(
                              color: colors.fonts.main,
                            ),
                            maxLines: null,
                            cursorColor: colors.accents.blue,
                            decoration: InputDecoration(
                              labelStyle: open.s14.copyWith(
                                color: colors.fonts.secondary,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                borderSide: BorderSide(
                                  color: colors.components.blocks.border,
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
                              labelText: "Write your comment",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: BlocBuilder<MovieCubit, MovieState>(
                            builder: (context, state) {
                              bool activeStatus = false;

                              if (commentText.isNotEmpty &&
                                  currentRating != 0.0) {
                                activeStatus = true;
                              }

                              return GestureDetector(
                                onTap: activeStatus
                                    ? () {
                                        context.read<MovieCubit>().postComment(
                                              PostCommentModel(
                                                content:
                                                    commentTextFieldController
                                                        .text,
                                                rating: currentRating.toInt(),
                                                movieId: state.movieId,
                                              ),
                                            );

                                        commentTextFieldController.clear();
                                      }
                                    : null,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Icon(
                                    Icons.send,
                                    color: !activeStatus
                                        ? colors.backgrounds.secondary
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
    );
  }
}
