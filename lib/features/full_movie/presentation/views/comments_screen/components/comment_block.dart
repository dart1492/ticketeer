import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/full_movie/domain/entities/comment.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/cubit/movie_cubit.dart';

/// Widget that represents the comment entity
class CommentBlock extends StatelessWidget {
  /// Comment object
  final Comment commentObj;

  /// Widget that represents the comment entity
  const CommentBlock({
    super.key,
    required this.commentObj,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: colors.components.blocks.border,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commentObj.content,
                  softWrap: true,
                  style: open.s16.copyWith(
                    color: colors.fonts.main,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                RatingBarIndicator(
                  unratedColor: colors.backgrounds.secondary,
                  rating: commentObj.rating.toDouble(),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: colors.accents.blue,
                  ),
                  itemCount: 5,
                  itemSize: 20,
                  direction: Axis.horizontal,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "by: ${commentObj.author}",
                  style: open.s16.copyWith(
                    color: colors.fonts.main,
                  ),
                ),
              ],
            ),
          ),
          if (commentObj.isMine)
            GestureDetector(
              onTap: () {
                context.read<MovieCubit>().deleteComment(commentObj.id);
              },
              child: Icon(
                FeatherIcons.delete,
                color: colors.accents.red,
                size: 25,
              ),
            ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
