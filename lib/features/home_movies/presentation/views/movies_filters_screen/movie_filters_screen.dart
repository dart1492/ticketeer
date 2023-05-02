import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_state.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_filters_screen/components/date_list_view.dart';
import 'package:ticketeer/features/home_movies/presentation/views/movies_filters_screen/components/year_sort_chooser.dart';

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
  static const _basePath = "screens.movies-home.filters-screen.";
  late TextEditingController minYearController;

  late TextEditingController maxYearController;

  late TextEditingController ageController;

  late bool isShowingOnlySaved;

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
          backgroundColor: colors.backgrounds.secondary,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              context.popRoute();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: colors.accents.blue,
              size: 25,
            ),
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
                  "${_basePath}date".tr(),
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
                  basePath: _basePath,
                ),
                Row(
                  children: [
                    Text(
                      "${_basePath}age".tr(),
                      style: open.s18.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: 40,
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
                      "${_basePath}show-only-saved".tr(),
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
                            setState(() {
                              isShowingOnlySaved = newValue;
                            });
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
                const SizedBox(
                  height: 20,
                ),
                Builder(
                  builder: (context) {
                    return CustomButton(
                      onTap: () {
                        context.read<HomeMoviesCubit>().updateFilters(
                              isShowingSaved: isShowingOnlySaved,
                              maxYear: int.parse(maxYearController.text),
                              minYear: int.parse(minYearController.text),
                              age: int.parse(ageController.text),
                            );
                      },
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      childAlignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        "${_basePath}save".tr(),
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
