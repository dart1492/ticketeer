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
          return CustomTextField(
            onChanged: (p0) {
              context.read<ProfileCubit>().updateUsername(p0);
            },
          );
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
