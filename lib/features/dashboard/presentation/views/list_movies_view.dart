import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../cubit/movies_listings/movies_listings_cubit.dart';

class ListMoviesView extends StatelessWidget {
  const ListMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<MoviesListingsCubit>()..getMovies(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Movies'),
        ),
        body: BlocBuilder<MoviesListingsCubit, MoviesListingsState>(
          builder: (context, state) {
            return switch (state) {
              MoviesListingsLoading() =>
                const Center(child: CircularProgressIndicator()),
              MoviesListingsLoaded() => ListMovies(
                  movies: state.moviesListings.movies,
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

class ListMovies extends StatelessWidget {
  const ListMovies({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          context.read<MoviesListingsCubit>().getMovies();
        }
        return true;
      },
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Card(
              color: AppColors.creamCan,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'id: ${movie.id}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: 'Year: ',
                        style: const TextStyle(
                          color: AppColors.mineShaft,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: movie.year.toString(),
                            style: const TextStyle(
                              color: AppColors.mineShaft,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: 'Title: ',
                        style: const TextStyle(
                          color: AppColors.mineShaft,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: movie.title,
                            style: const TextStyle(
                              color: AppColors.mineShaft,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        text: 'Winner: ',
                        style: const TextStyle(
                          color: AppColors.mineShaft,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: movie.isWinner ? 'Yes' : 'No',
                            style: const TextStyle(
                              color: AppColors.mineShaft,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
