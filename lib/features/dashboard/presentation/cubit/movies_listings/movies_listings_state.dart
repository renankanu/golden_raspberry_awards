part of 'movies_listings_cubit.dart';

class MoviesListingsState extends Equatable {
  const MoviesListingsState();

  @override
  List<Object> get props => [];
}

class MoviesListingsInitial extends MoviesListingsState {
  const MoviesListingsInitial();
}

class MoviesListingsLoading extends MoviesListingsState {
  const MoviesListingsLoading();
}

class MoviesListingsLoaded extends MoviesListingsState {
  const MoviesListingsLoaded(this.moviesListings);

  final MoviesListings moviesListings;

  @override
  List<Object> get props => [moviesListings];
}

class MoviesListingsError extends MoviesListingsState {
  const MoviesListingsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
