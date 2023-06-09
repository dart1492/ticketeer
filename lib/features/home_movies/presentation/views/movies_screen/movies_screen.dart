import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_screen/components/actions_row.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_screen/components/movie_search_field.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_screen/components/movies_list.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Home screen where movies are shown, search and ticket purchase happens here
class MoviesScreen extends StatelessWidget {
  /// Home screen where movies are shown, search and ticket purchase happens
  /// here
  const MoviesScreen({super.key});

  static const _basePath = "screens.movies_home.";
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocProvider(
      create: (context) => sl<HomeMoviesCubit>()..getMovies(),
      child: Scaffold(
        backgroundColor: colors.backgrounds.main,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: colors.backgrounds.main,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MovieSearchField(
                    basePath: _basePath,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ActionsRow(
                    basePath: _basePath,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MoviesList(
                    basePath: _basePath,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
