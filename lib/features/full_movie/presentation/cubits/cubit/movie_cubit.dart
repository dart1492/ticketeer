import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/full_movie/data/models/post_comment_model.dart';
import 'package:ticketeer/features/full_movie/domain/repositories/movie_repository.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/cubit/movie_state.dart';

/// Manages comments of the movie screen
class MovieCubit extends Cubit<MovieState> {
  /// Repository instance
  final MovieRepository repo;

  /// Manages comments of the movie screen
  MovieCubit(
    this.repo,
  ) : super(
          MovieState(
            comments: [],
            isLoading: false,
            movieId: 0,
          ),
        );

  /// Get comments to the movie. ID will be passed to the function call,
  ///  because this bloc doesn't manage state of currently showing movie
  Future<void> getComments(int movieId) async {
    emit(
      state.copyWith(
        isLoading: true,
        movieId: movieId,
      ),
    );
    final result = await repo.getComments(movieId);
    result.fold(
      (l) => emit(
        state.copyWith(
          errorText: l.errorMessage,
          isLoading: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          comments: r,
          isLoading: false,
        ),
      ),
    );
  }

  /// add new comment to the section
  Future<void> postComment(PostCommentModel comment) async {
    final result = await repo.postComment(comment);
    result.fold(
      (l) {
        emit(
          state.copyWith(
            errorText: l.errorMessage,
          ),
        );
        emit(
          state.copyWith(
            errorText: null,
          ),
        );
      },
      (r) {
        getComments(state.movieId);
      },
    );
  }

  /// delete comment by its id
  Future<void> deleteComment(int commentId) async {
    final result = await repo.deleteComment(commentId);
    result.fold(
      (l) => emit(
        state.copyWith(
          errorText: l.errorMessage,
        ),
      ),
      (r) {
        final newList = state.comments;

        newList.removeWhere(
          (element) => element.id == commentId,
        );
        emit(
          state.copyWith(comments: newList),
        );
      },
    );
  }
}
