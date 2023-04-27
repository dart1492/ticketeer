import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

// TODO: CREATE BETTER SHIMMER

/// Shimmer for loading
class MoviesListLoader extends StatelessWidget {
  /// Shimmer for loading
  const MoviesListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    final width = MediaQuery.of(context).size.width / 2;
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: null,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: width / 440,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return SizedBox(
          width: 100.0,
          height: 200.0,
          child: Shimmer.fromColors(
            baseColor: colors.backgrounds.secondary,
            highlightColor: colors.accents.blue,
            child: Container(
              color: colors.accents.blue,
              height: 200,
              width: 100,
            ),
          ),
        );
      },
    );
  }
}
