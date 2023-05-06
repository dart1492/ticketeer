import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/profile/data/models/user_model.dart';
import 'package:ticketeer/features/profile/domain/repositories/profile_repository.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_state.dart';

/// Manages profile state (retrieves and changes username)
class ProfileCubit extends Cubit<GeneralProfileState> {
  /// Profile repository
  final ProfileRepository repo;

  /// Manages profile state (retrieves and changes username)
  ProfileCubit(this.repo) : super(GeneralProfileState());

  /// Get user object
  Future<void> getUser() async {
    emit(ProfileLoading());
    final result = await repo.getUser();
    result.fold(
      (l) => emit(
        ProfileError(errorMessage: l.errorMessage),
      ),
      (r) => emit(
        ProfileIdle(
          user: r,
        ),
      ),
    );
  }

  /// Tells cubit to change status of isEditing to true and replace username
  ///  with textfield
  void editUsername() {
    final UserModel currentUser = (state as ProfileLoaded).user as UserModel;
    emit(
      ProfileEditing(currentValue: '', user: currentUser),
    );
  }

  /// Abort changing users name and leave it unchanged
  void abortEditUsername() {
    final UserModel currentUser = (state as ProfileEditing).user as UserModel;
    emit(
      ProfileIdle(user: currentUser),
    );
  }

  /// Change value of the edited name
  void updateUsername(String newName) {
    final UserModel currentUser = (state as ProfileEditing).user as UserModel;
    emit(
      ProfileEditing(user: currentUser, currentValue: newName),
    );
  }

  /// Sends a request to change the user name
  Future<void> changeUsername() async {
    final UserModel currentUser = (state as ProfileEditing).user as UserModel;
    final String newName = (state as ProfileEditing).currentValue;

    emit(ProfileLoading());

    final result = await repo.changeUsername(newName);
    result.fold((l) {
      emit(
        ProfileError(errorMessage: l.errorMessage),
      );
      emit(
        ProfileIdle(
          user: currentUser,
        ),
      );
    }, (r) {
      emit(
        ProfileSuccess(),
      );
      emit(
        ProfileIdle(
          user: currentUser.copyWith(name: newName),
        ),
      );
    });
  }
}
