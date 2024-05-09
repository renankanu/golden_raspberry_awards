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
  const MultiWinnerYearsLoaded(this.multiWinnersYears);

  final List<MultiWinnerYear> multiWinnersYears;

  @override
  List<Object> get props => [multiWinnersYears];
}

class MultiWinnerYearsError extends MultiWinnerYearsState {
  const MultiWinnerYearsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
