import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/home/domain/repositories/movies_repository.dart';
import 'package:ticketeer/features/home/presentation/cubits/cubit/home_state.dart';

/// Cubit that is responsible for getting movies -
/// based on the input of a search field or just first random ones
class HomeCubit extends Cubit<HomeState> {
  /// Movies repository
  final MoviesRepository repo;

  /// Cubit that is responsible for getting movies -
  /// based on the input of a search field or just first random ones
  HomeCubit(this.repo)
      : super(
          HomeState(
            isLoading: false,
            movies: [],
            queryText: '',
            queryDate: DateTime.now(),
          ),
        );

  /// Loading movies feature
  Future<void> getMovies() async {
    emit(state.copyWith(isLoading: true));
    final result = await repo.getMovies("", state.queryDate);
    result.fold(
      (l) => null, // TODO: IMPLEMENT ERROR HANDLING
      (r) => emit(
        state.copyWith(
          movies: r,
          isLoading: false,
        ),
      ),
    );
  }

  /// Pass a new date to filter movies list
  Future<void> getMoviesDate(DateTime newDate) async {
    emit(
      state.copyWith(
        isLoading: true,
        queryDate: newDate,
      ),
    );
    final result = await repo.getMovies(state.queryText, state.queryDate);
    result.fold(
      (l) => null, // TODO: IMPLEMENT ERROR HANDLING
      (r) => emit(
        state.copyWith(
          movies: r,
          isLoading: false,
        ),
      ),
    );
  }

  /// Pass a new text to filter the text
  Future<void> getMoviesText(String queryText) async {
    emit(
      state.copyWith(
        isLoading: true,
        queryText: queryText,
      ),
    );
    final result = await repo.getMovies(state.queryText, state.queryDate);
    result.fold(
      (l) => null, // TODO: IMPLEMENT ERROR HANDLING
      (r) => emit(
        state.copyWith(
          movies: r,
          isLoading: false,
        ),
      ),
    );
  }
}
