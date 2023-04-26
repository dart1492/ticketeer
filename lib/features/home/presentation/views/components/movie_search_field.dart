import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/util/debounce.dart';
import 'package:ticketeer/features/home/presentation/cubits/cubit/home_cubit.dart';

/// Search field for filtering movies by name
class MovieSearchField extends StatefulWidget {
  /// Search field for filtering movies by name
  const MovieSearchField({
    super.key,
  });

  @override
  State<MovieSearchField> createState() => _MovieSearchFieldState();
}

class _MovieSearchFieldState extends State<MovieSearchField> {
  FocusNode node = FocusNode();
  bool isFocused = false;

  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  @override
  void initState() {
    node.addListener(
      () {
        setState(
          () {
            isFocused = node.hasFocus;
          },
        );
      },
    );
    super.initState();
  }

  void _debounceGetMovies(String text) {
    _debouncer(() {
      context.read<HomeCubit>().getMoviesText(text);
    });
  }

  @override
  void dispose() {
    _debouncer.cancel();
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return CustomTextField(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      focusNode: node,
      prefixIcon: Icon(
        Iconsax.search_normal,
        size: 18,
        color: isFocused ? colors.accents.blue : colors.fonts.secondary,
      ),
      onChanged: _debounceGetMovies,
    );
  }
}
