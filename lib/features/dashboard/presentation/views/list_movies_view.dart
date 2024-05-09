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
              MoviesListingsLoading() => const AppIndicator(),
              MoviesListingsLoaded() => ListMovies(movies: state.movies),
              MoviesListingsError() => const Center(child: Text('Error')),
              _ => const SizedBox.shrink()
            };
          },
        ),
      ),
    );
  }
}

class ListMovies extends StatefulWidget {
  const ListMovies({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final position = _scrollController.position;
      final isBottom = position.maxScrollExtent == _scrollController.offset &&
          position.pixels == position.maxScrollExtent;
      if (isBottom) {
        context.read<MoviesListingsCubit>().getMovies();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.movies.length,
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
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
        ),
      ],
    );
  }
}
