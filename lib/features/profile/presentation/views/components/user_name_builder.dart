import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_state.dart';

/// User name widget that switches between the actual username and a
/// text field to change this username
class UserName extends StatelessWidget {
  /// User name widget that switches between the actual username and a
  /// text field to change this username
  const UserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileEditing) {
          return const NameTextField();
        }
        return Text(
          (state as ProfileLoaded).user.name,
          style: open.s32.w700.copyWith(
            color: colors.accents.blue,
          ),
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
