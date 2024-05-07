part of 'get_multi_winner_years_cubit.dart';

sealed class GetMultiWinnerYearsState extends Equatable {
  const GetMultiWinnerYearsState();

  @override
  List<Object> get props => [];
}

class GetMultiWinnerYearsInitial extends GetMultiWinnerYearsState {
  const GetMultiWinnerYearsInitial();
}

class GetMultiWinnerYearsLoading extends GetMultiWinnerYearsState {
  const GetMultiWinnerYearsLoading();
}

class GetMultiWinnerYearsLoaded extends GetMultiWinnerYearsState {
  final List<MultiWinnerYear> multiWinnersEntity;
  const GetMultiWinnerYearsLoaded(this.multiWinnersEntity);

  @override
  List<Object> get props => [multiWinnersEntity];
}

class GetMultiWinnerYearsError extends GetMultiWinnerYearsState {
  final String message;
  const GetMultiWinnerYearsError(this.message);

  @override
  List<Object> get props => [message];
}
