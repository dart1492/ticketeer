import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/components/static_elements/validation_error_box.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_state.dart';

/// User name widget that switches between the actual username and a
/// text field to change this username
class UserName extends StatelessWidget {
  final String _basePath;

  /// User name widget that switches between the actual username and a
  /// text field to change this username
  const UserName({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocBuilder<ProfileCubit, GeneralProfileState>(
      builder: (context, state) {
        if (state is ProfileEditing) {
          return const NameTextField();
        }

        if (state is ProfileLoaded) {
          if (state.user.name.isEmpty) {
            return ValidationErrorBox(
              errorText: "${_basePath}empty_name".tr(),
              isShown: false,
            );
          }
          return Text(
            state.user.name,
            style: open.s32.w700.copyWith(
              color: colors.accents.blue,
            ),
          );
        }

        return const ValidationErrorBox(
          errorText: "Something went wrong!",
          isShown: false,
        );
      },
    );
  }
}

/// Textfield for username
class NameTextField extends StatefulWidget {
  /// Textfield for username
  const NameTextField({
    super.key,
  });

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  FocusNode node = FocusNode();

  @override
  void initState() {
    node.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      focusNode: node,
      onChanged: (p0) {
        context.read<ProfileCubit>().updateUsername(p0);
      },
    );
  }
}
