import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/movie_usecases.dart';

part 'movies_listings_state.dart';

class MoviesListingsCubit extends Cubit<MoviesListingsState> {
  MoviesListingsCubit(this.movieUsecases)
      : super(const MoviesListingsInitial());

  final MovieUsecases movieUsecases;

  Future<void> getTopWinningStudios({
    required int page,
    required int size,
    int? year,
    bool? isWinner,
  }) async {
    emit(const MoviesListingsLoading());
    final result = await movieUsecases(
      page: page,
      size: size,
      year: year,
      isWinner: isWinner,
    );
    result.fold(
      (error) => emit(MoviesListingsError(error.message)),
      (moviesListings) => emit(MoviesListingsLoaded(moviesListings)),
    );
  }
}
