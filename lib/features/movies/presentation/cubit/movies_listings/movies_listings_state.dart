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
  const MoviesListingsLoaded(this.movies);

  final List<Movie> movies;

  @override
  List<Object> get props => [movies];
}

class MoviesListingsError extends MoviesListingsState {
  const MoviesListingsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
