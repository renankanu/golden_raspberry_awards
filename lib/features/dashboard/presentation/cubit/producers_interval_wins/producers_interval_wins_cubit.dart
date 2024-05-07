import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_producers_interval_victories.dart';

part 'producers_interval_wins_state.dart';

class ProducersIntervalWinsCubit extends Cubit<ProducersIntervalWinsState> {
  final GetProducersIntervalVictoriesUseCase producersIntervalWinsUseCase;

  ProducersIntervalWinsCubit(this.producersIntervalWinsUseCase)
      : super(const ProducersIntervalWinsInitial());

  Future<void> getProducersIntervalWins() async {
    emit(const ProducersIntervalWinsLoading());
    final result = await producersIntervalWinsUseCase();
    result.fold(
      (error) => emit(const ProducersIntervalWinsError()),
      (producersIntervalWins) =>
          emit(ProducersIntervalWinsLoaded(producersIntervalWins)),
    );
  }
}
