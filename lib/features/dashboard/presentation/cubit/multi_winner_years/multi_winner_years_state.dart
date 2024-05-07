part of 'multi_winner_years_cubit.dart';

sealed class MultiWinnerYearsState extends Equatable {
  const MultiWinnerYearsState();

  @override
  List<Object> get props => [];
}

class MultiWinnerYearsInitial extends MultiWinnerYearsState {
  const MultiWinnerYearsInitial();
}

class MultiWinnerYearsLoading extends MultiWinnerYearsState {
  const MultiWinnerYearsLoading();
}

class MultiWinnerYearsLoaded extends MultiWinnerYearsState {
  final List<MultiWinnerYear> multiWinnersYears;
  const MultiWinnerYearsLoaded(this.multiWinnersYears);

  @override
  List<Object> get props => [multiWinnersYears];
}

class MultiWinnerYearsError extends MultiWinnerYearsState {
  final String message;
  const MultiWinnerYearsError(this.message);

  @override
  List<Object> get props => [message];
}
