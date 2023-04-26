import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/features/movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/features/movies/presentation/views/components/date_list_view.dart';
import 'package:ticketeer/features/movies/presentation/views/components/movie_search_field.dart';
import 'package:ticketeer/features/movies/presentation/views/components/movies_list.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Home screen where movies are shown, search and ticket purchase happens here
class MoviesScreen extends StatelessWidget {
  /// Home screen where movies are shown, search and ticket purchase happens
  /// here
  const MoviesScreen({super.key});

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
                children: const [
                  MovieSearchField(),
                  SizedBox(
                    height: 10,
                  ),
                  DateListView(),
                  SizedBox(
                    height: 10,
                  ),
                  MoviesList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
