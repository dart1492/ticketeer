// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ticketeer/features/profile/domain/entities/user.dart';

/// General state
class GeneralProfileState {}

/// indicates that user profile is loaded from the server
class ProfileLoaded extends GeneralProfileState {
  /// User object
  final User user;

  /// indicates that user profile is loaded from the server
  ProfileLoaded({
    required this.user,
  });
}

/// indicates that user profile is loaded and the profile name is being edited
class ProfileEditing extends ProfileLoaded {
  /// Current value in the tet field
  String currentValue;

  /// indicates that user profile is loaded and the profile name is being edited
  ProfileEditing({
    required this.currentValue,
    required super.user,
  });
}

/// indicates that user profile is loaded and is waiting for action
class ProfileIdle extends ProfileLoaded {
  /// indicates that user profile is loaded and is waiting for action
  ProfileIdle({
    required super.user,
  });
}

/// Loading state
class ProfileLoading extends GeneralProfileState {}

/// Error - either in initial loading or in name changing
class ProfileError extends GeneralProfileState {
  /// Error message
  String errorMessage;

  /// Error - either in initial loading or in name changing
  ProfileError({
    required this.errorMessage,
  });
}

class ProfileEditingError extends GeneralProfileState {}

/// Profile success - needed for listener that informs user if the name changing
/// operation was successful
class ProfileSuccess extends GeneralProfileState {}
