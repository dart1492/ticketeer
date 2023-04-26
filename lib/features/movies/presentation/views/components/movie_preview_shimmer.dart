import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

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
        return Column(
          children: [
            Shimmer(
              direction: const ShimmerDirection.fromLBRT(),
              color: colors.fonts.main,
              colorOpacity: 0.3,
              child: const SizedBox(
                height: 300,
                width: 300,
              ),
            ),
          ],
        );
      },
    );
  }
}
