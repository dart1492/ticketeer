import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
        return Column(
          children: [
            SizedBox(
              height: 300,
              width: 200,
              child: Shimmer(
                direction: ShimmerDirection.ttb,
                gradient: LinearGradient(
                  colors: [
                    colors.components.blocks.border,
                    colors.components.blocks.background
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.components.blocks.border),
                    color: colors.components.blocks.background,
                  ),
                  height: 200,
                  width: 100,
                ),
              ),
            ).animate().fadeIn(
                  duration: const Duration(milliseconds: 300),
                ),
          ],
        );
      },
    );
  }
}
