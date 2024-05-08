import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/producers_interval_victories_usecases.dart';

part 'producers_interval_wins_state.dart';

class ProducersIntervalWinsCubit extends Cubit<ProducersIntervalWinsState> {
  ProducersIntervalWinsCubit(this.producersIntervalWinsUseCase)
      : super(const ProducersIntervalWinsInitial());

  final ProducersIntervalVictoriesUseCase producersIntervalWinsUseCase;

  Future<void> getProducersIntervalWins() async {
    emit(const ProducersIntervalWinsLoading());
    final result = await producersIntervalWinsUseCase();
    result.fold(
      (error) => emit(ProducersIntervalWinsError(error.message)),
      (success) => emit(ProducersIntervalWinsLoaded(success)),
    );
  }
}
