import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/movie_usecases.dart';

part 'movies_listings_state.dart';

class MoviesListingsCubit extends Cubit<MoviesListingsState> {
  MoviesListingsCubit(this.movieUsecases)
      : super(const MoviesListingsInitial());

  final MovieUsecases movieUsecases;
  int _page = 1;
  final int _size = 20;
  final List<Movie> _movies = [];
  bool hasReachedMax = false;

  Future<void> getMovies({
    int? year,
    bool? isWinner,
  }) async {
    if (state is MoviesListingsLoading) {
      return;
    }
    emit(const MoviesListingsLoading());
    final result = await movieUsecases(
      page: _page,
      size: _size,
      year: year,
      isWinner: isWinner,
    );
    result.fold(
      (error) => emit(MoviesListingsError(error.message)),
      (moviesListings) {
        _page++;
        _movies.addAll(moviesListings.movies);

        if (moviesListings.movies.length < 20) {
          hasReachedMax = true;
        }

        emit(MoviesListingsLoaded(moviesListings));
      },
    );
  }
}
