import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/cubit/movie_cubit.dart';

@RoutePage()

/// Comment section for a full movie
class CommentsScreen extends StatelessWidget {
  /// Cubit to manage comments
  final MovieCubit cubit;

  /// Id of the currently viewed movie
  final int movieId;

  /// Comment section for a full movie
  const CommentsScreen({
    super.key,
    required this.cubit,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider.value(
      value: cubit..getComments(movieId),
      child: Scaffold(
        backgroundColor: colors.backgrounds.main,
        body: SafeArea(
          child: Column(
            children: [
              Text("Hi"),
            ],
          ),
        ),
      ),
    );
  }
}
