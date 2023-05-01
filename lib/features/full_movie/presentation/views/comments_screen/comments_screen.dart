import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_toasts.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_state.dart';
import 'package:ticketeer/features/full_movie/presentation/views/comments_screen/components/actions_row.dart';
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
          backgroundColor: colors.backgrounds.main,
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      HeaderCommentsRow(basePath: _basePath),
                      SizedBox(
                        height: 10,
                      ),
                      CommentsList(),
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
