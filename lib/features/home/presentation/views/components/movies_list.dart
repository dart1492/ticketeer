import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:ticketeer/features/home/presentation/cubits/cubit/home_state.dart';

/// List of movies, that gets shown on the screen
class MoviesList extends StatelessWidget {
  /// List of movies, that gets shown on the screen
  const MoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Text(
                  state.movies[index].name,
                );
              },
            );
          }
        },
      ),
    );
  }
}
