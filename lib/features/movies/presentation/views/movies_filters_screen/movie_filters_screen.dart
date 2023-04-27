import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/movies/data/models/movie_filters_model.dart';
import 'package:ticketeer/features/movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/features/movies/presentation/views/movies_filters_screen/components/date_list_view.dart';
import 'package:ticketeer/features/movies/presentation/views/movies_filters_screen/components/year_sort_chooser.dart';

@RoutePage()

/// Page where user can set up filters for movie list
class MovieFiltersScreen extends StatefulWidget {
  /// Page where user can set up filters for movie list
  const MovieFiltersScreen({super.key, required this.cubit});

  /// cubit. Passing it here allows us to modify the state and call cubit
  /// functions on this screen
  final HomeMoviesCubit cubit;

  @override
  State<MovieFiltersScreen> createState() => _MovieFiltersScreenState();
}

class _MovieFiltersScreenState extends State<MovieFiltersScreen> {
  late TextEditingController minYearController;

  late TextEditingController maxYearController;

  // TODO: ADD MORE FILTERS (OPTIONAL)
  @override
  void initState() {
    minYearController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.cubit.state.movieFilters.minYear.toString(),
      ),
    );

    maxYearController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.cubit.state.movieFilters.maxYear.toString(),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    minYearController.dispose();
    maxYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocProvider.value(
      value: widget.cubit,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colors.backgrounds.main,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.popRoute();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.backward,
                        size: 25,
                        color: colors.accents.blue,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Back",
                        style: open.s18.copyWith(
                          color: colors.fonts.main,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Choose date of the film session:",
                  style: open.s18.copyWith(color: colors.fonts.main),
                ),
                const SizedBox(
                  height: 10,
                ),
                const DateListView(),
                YearChooser(
                  maxYearController: maxYearController,
                  minYearController: minYearController,
                ),
                Builder(
                  builder: (context) {
                    return CustomButton(
                      onTap: () {
                        final newFilters = MovieFiltersModel(
                          maxYear: int.parse(maxYearController.text),
                          minYear: int.parse(minYearController.text),
                        );
                        context.read<HomeMoviesCubit>().getMovies(
                              movieFilters: newFilters,
                            );
                      },
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      childAlignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        "Save",
                        style: open.s18.copyWith(color: colors.fonts.main),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
