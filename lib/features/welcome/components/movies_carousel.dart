import 'package:flutter/material.dart';

/// Carousel with the movie images
class MoviesCarousel extends StatelessWidget {
  /// Carousel with the movie images
  const MoviesCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 200,
            child: Container(
              height: 190,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/movie_2.jpg"),
                ),
              ),
            ),
          ),
          Positioned(
            right: 200,
            child: Container(
              height: 190,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/movie_3.jpg"),
                ),
              ),
            ),
          ),
          Container(
            height: 240,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/movie_1.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
