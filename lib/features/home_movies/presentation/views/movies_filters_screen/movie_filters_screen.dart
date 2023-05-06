import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_state.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_filters_screen/components/date_list_view.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_filters_screen/components/year_sort_chooser.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Page where user can set up filters for movie list
class MovieFiltersScreen extends StatefulWidget {
  /// Page where user can set up filters for movie list
  const MovieFiltersScreen({super.key, required this.cubit});

  /// cubit. Passing it here allows us to modify the state and call cubit
  /// functions on this screen
  final HomeMoviesCubit cubit;

  static const _basePath = "screens.filters_screen.";

  @override
  State<MovieFiltersScreen> createState() => _MovieFiltersScreenState();
}

class _MovieFiltersScreenState extends State<MovieFiltersScreen> {
  late TextEditingController minYearController;

  late TextEditingController maxYearController;

  late TextEditingController ageController;

  late bool isShowingOnlySaved;
  void _saveFilters(BuildContext context) {
    int? maxYear;
    int? minYear;
    int? age;

    try {
      maxYear = int.parse(
        maxYearController.text,
      );

      minYear = int.parse(
        minYearController.text,
      );

      age = int.parse(
        ageController.text,
      );
    } catch (e) {
      sl<Logger>().e(e.toString());
    }

    context.read<HomeMoviesCubit>().updateFilters(
          isShowingSaved: isShowingOnlySaved,
          maxYear: maxYear,
          minYear: minYear,
          age: age,
        );
  }

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

    ageController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.cubit.state.movieFilters.age.toString(),
      ),
    );

    isShowingOnlySaved = widget.cubit.state.movieFilters.isShowingSaved;

    super.initState();
  }

  @override
  void dispose() {
    minYearController.dispose();
    maxYearController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocProvider.value(
      value: widget.cubit,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 100,
          leading: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  _saveFilters(context);
                  context.popRoute();
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: colors.accents.blue,
                        size: 20,
                      ),
                      Text(
                        "components.app_bar.back".tr(),
                        style: open.s16.copyWith(
                          color: colors.fonts.main,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: colors.backgrounds.main,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${MovieFiltersScreen._basePath}date".tr(),
                  style: open.s18.copyWith(color: colors.fonts.main),
                ),
                const SizedBox(
                  height: 10,
                ),
                const DateListView(),
                const SizedBox(
                  height: 10,
                ),
                YearChooser(
                  maxYearController: maxYearController,
                  minYearController: minYearController,
                  basePath: MovieFiltersScreen._basePath,
                ),
                Row(
                  children: [
                    Text(
                      "${MovieFiltersScreen._basePath}age".tr(),
                      style: open.s18.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: 60,
                      child: CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: ageController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "${MovieFiltersScreen._basePath}show_only_saved".tr(),
                      style: open.s18.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    BlocBuilder<HomeMoviesCubit, HomeMoviesState>(
                      builder: (context, state) {
                        return Switch(
                          value: isShowingOnlySaved,
                          onChanged: (newValue) {
                            setState(
                              () {
                                isShowingOnlySaved = newValue;
                              },
                            );
                          },
                          inactiveTrackColor: colors.components.blocks.border,
                          inactiveThumbColor:
                              colors.components.blocks.background,
                          activeColor: colors.accents.blue,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
