import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/movie_usecases.dart';

part 'movies_listings_state.dart';

class MoviesListingsCubit extends Cubit<MoviesListingsState> {
  MoviesListingsCubit(this.movieUsecases)
      : super(const MoviesListingsInitial());

  final MovieUsecases movieUsecases;

  int _page = 0;
  int? _year;
  bool? _isWinner;
  final int _size = 20;
  final List<Movie> _movies = [];
  bool hasReachedMax = false;

  int? get year => _year;
  bool? get isWinner => _isWinner;

  Future<void> getMovies() async {
    if (hasReachedMax) {
      return;
    }

    if (state is! MoviesListingsLoaded) {
      emit(const MoviesListingsLoading());
    }

    final result = await movieUsecases(
      page: _page,
      size: _size,
      year: _year,
      isWinner: _isWinner,
    );

    result.fold(
      (error) => emit(MoviesListingsError(error.message)),
      (success) {
        _page++;
        _movies.addAll(success.movies);

        if (success.movies.length < _size) {
          hasReachedMax = true;
        }

        emit(MoviesListingsLoaded(List.of(_movies)));
      },
    );
  }

  Future<void> filterMovies({
    int? year,
    bool? isWinner,
  }) async {
    _page = 0;
    _year = year;
    _isWinner = isWinner;
    _movies.clear();
    emit(MoviesListingsLoaded(List.of(_movies)));
    hasReachedMax = false;
    await getMovies();
  }
}
