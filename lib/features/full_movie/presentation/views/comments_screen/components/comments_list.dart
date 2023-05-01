import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_state.dart';
import 'package:ticketeer/features/full_movie/presentation/views/comments_screen/components/comment_block.dart';

/// List view with comments
class CommentsList extends StatelessWidget {
  /// List view with comments
  const CommentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, GeneralCommentsState>(
      builder: (context, state) {
        if (state is LoadedCommentsState) {
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
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
