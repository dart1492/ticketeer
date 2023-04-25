import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_state.dart';

/// Button to change user name. If the state's isEditing == false,
/// then it allows us to write a new name. If it is true, it allows us to save
/// edited name
class ChangeNameButton extends StatelessWidget {
  /// Button to change user name. If the state's isEditing == false,
  /// then it allows us to write a new name. If it is true, it allows us to save
  /// edited name
  const ChangeNameButton({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  final String _basePath;

  //TODO: CREATE AN ABORT BUTTON TO PREVENT NAME FROM CHANGING
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return CustomButton(
          onTap: state is! ProfileEditing
              ? () {
                  context.read<ProfileCubit>().editUsername();
                }
              : () {
                  context.read<ProfileCubit>().changeUsername();
                },
          color: colors.components.blocks.background,
          border: Border.all(
            color: colors.components.blocks.border,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              state is ProfileEditing
                  ? "$_basePath.done-change-username".tr()
                  : "$_basePath.change-username".tr(),
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ),
        );
      },
    );
  }
}
