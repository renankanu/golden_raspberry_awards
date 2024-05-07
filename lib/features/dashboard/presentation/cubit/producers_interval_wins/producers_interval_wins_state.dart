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
  final List<ProducersIntervalWins> producersIntervalWins;
  const ProducersIntervalWinsLoaded(this.producersIntervalWins);

  @override
  List<Object> get props => [producersIntervalWins];
}

class ProducersIntervalWinsError extends ProducersIntervalWinsState {
  const ProducersIntervalWinsError();
}
