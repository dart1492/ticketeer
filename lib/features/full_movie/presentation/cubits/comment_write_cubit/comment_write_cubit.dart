import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/full_movie/data/models/post_comment_model.dart';
import 'package:ticketeer/features/full_movie/domain/repositories/movie_repository.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comment_write_cubit/comment_write_state.dart';

/// Cubit manages creating and posting comments
class CommentWriteCubit extends Cubit<GeneralCommentWriteState> {
  /// movie repository to post comment
  final MovieRepository repo;

  /// Cubit manages creating and posting comments
  CommentWriteCubit(this.repo) : super(GeneralCommentWriteState());

  /// initializes create comment state
  void init(int movieId) {
    emit(
      CreatingCommentWriteState(commentText: '', rating: 0.0, movieId: movieId),
    );
  }

  /// add new comment to the section
  Future<void> postComment() async {
    if (state is CreatingCommentWriteState) {
      final previousState = state as CreatingCommentWriteState;
      final result = await repo.postComment(
        PostCommentModel(
          content: previousState.commentText,
          rating: previousState.rating.toInt(),
          movieId: previousState.movieId,
        ),
      );

      result.fold(
        (l) {
          emit(
            ErrorWritingCommentState(
              errorMessage: l.errorMessage,
            ),
          );
          emit(previousState);
        },
        (r) {
          emit(SuccessWritingCommentState());
          emit(
            previousState.copyWith(commentText: '', rating: 0.0),
          );
        },
      );
    }
  }

  /// Update comment text
  void updateCommentText(String text) {
    final currentState = state as CreatingCommentWriteState;
    emit(currentState.copyWith(commentText: text));
  }

  /// Update rating
  void updateRating(double rating) {
    final currentState = state as CreatingCommentWriteState;
    emit(
      currentState.copyWith(rating: rating),
    );
  }
}
