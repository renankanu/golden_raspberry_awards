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
  final List<WinnersByYear> moviesWinner;
  const SearchByYearLoaded(this.moviesWinner);

  @override
  List<Object> get props => [moviesWinner];
}

class SearchByYearError extends SearchByYearState {
  final String message;
  const SearchByYearError(this.message);

  @override
  List<Object> get props => [message];
}
