part of 'producers_interval_wins_cubit.dart';

class ProducersIntervalWinsState extends Equatable {
  const ProducersIntervalWinsState();

  @override
  List<Object> get props => [];
}

class ProducersIntervalWinsInitial extends ProducersIntervalWinsState {
  const ProducersIntervalWinsInitial();
}

class ProducersIntervalWinsLoading extends ProducersIntervalWinsState {
  const ProducersIntervalWinsLoading();
}

class ProducersIntervalWinsLoaded extends ProducersIntervalWinsState {
  const ProducersIntervalWinsLoaded(this.producersIntervalWins);

  final ProducersIntervalWins producersIntervalWins;

  @override
  List<Object> get props => [producersIntervalWins];
}

class ProducersIntervalWinsError extends ProducersIntervalWinsState {
  const ProducersIntervalWinsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
