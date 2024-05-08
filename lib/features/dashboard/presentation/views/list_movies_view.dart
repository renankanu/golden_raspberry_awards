import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/movies_listings/movies_listings_cubit.dart';

class ListMoviesView extends StatelessWidget {
  const ListMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I<MoviesListingsCubit>()..movieUsecases(page: 1, size: 10),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Movies'),
        ),
        body: BlocBuilder<MoviesListingsCubit, MoviesListingsState>(
          builder: (context, state) {
            return switch (state) {
              MoviesListingsLoading() =>
                const Center(child: CircularProgressIndicator()),
              MoviesListingsLoaded() => Container(
                  child: ListView.builder(
                    itemCount: state.moviesListings.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.moviesListings.movies[index];
                      return ListTile(
                        title: Text(movie.title),
                        subtitle: Text(movie.year.toString()),
                      );
                    },
                  ),
                ),
              MoviesListingsError() => const Center(child: Text('Error')),
              _ => const SizedBox.shrink()
            };
          },
        ),
      ),
    );
  }
}
