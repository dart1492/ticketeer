import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/full_movie/domain/repositories/movie_repository.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_state.dart';

/// Manages comments for a chosen movie
class CommentsCubit extends Cubit<GeneralCommentsState> {
  /// Repository instance
  final MovieRepository repo;

  /// Manages comments for a chosen movie
  CommentsCubit(this.repo) : super(GeneralCommentsState());

  /// Initialize state with movieId
  void init(int movieId) {
    emit(
      LoadedCommentsState(
        comments: [],
        movieId: movieId,
      ),
    );
  }

  /// Get comments to the movie. ID will be passed to the function call,
  ///  because this bloc doesn't manage state of currently showing movie
  Future<void> getComments() async {
    if (state is LoadedCommentsState) {
      final prevState = state as LoadedCommentsState;
      emit(LoadingCommentsState());
      final result = await repo.getComments(prevState.movieId);
      result.fold(
        (l) {
          emit(
            ErrorCommentsState(l.errorMessage),
          );
          emit(prevState);
        },
        (r) {
          emit(
            LoadedCommentsState(comments: r, movieId: prevState.movieId),
          );
        },
      );
    }
  }

  /// delete comment by its id
  Future<void> deleteComment(int commentId) async {
    final previousState = state as LoadedCommentsState;
    final result = await repo.deleteComment(commentId);
    result.fold(
      (l) {
        emit(
          ErrorCommentsState(l.errorMessage),
        );
        getComments();
      },
      (r) {
        final newList = previousState.comments;

        newList.removeWhere(
          (element) => element.id == commentId,
        );
        emit(
          LoadedCommentsState(
            comments: newList,
            movieId: previousState.movieId,
          ),
        );
      },
    );
  }
}
