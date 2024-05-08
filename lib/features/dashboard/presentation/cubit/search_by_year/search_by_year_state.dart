part of 'search_by_year_cubit.dart';

class SearchByYearState extends Equatable {
  const SearchByYearState();

  @override
  List<Object> get props => [];
}

class SearchByYearInitial extends SearchByYearState {
  const SearchByYearInitial();
}

class SearchByYearLoading extends SearchByYearState {
  const SearchByYearLoading();
}

class SearchByYearLoaded extends SearchByYearState {
  const SearchByYearLoaded(this.moviesWinner);

  final List<Movie> moviesWinner;

  @override
  List<Object> get props => [moviesWinner];
}

class SearchByYearError extends SearchByYearState {
  const SearchByYearError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
