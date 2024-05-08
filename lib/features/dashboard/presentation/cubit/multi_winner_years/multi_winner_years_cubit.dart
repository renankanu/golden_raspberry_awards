import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/multi_winner_years_usecases.dart';

part 'multi_winner_years_state.dart';

class MultiWinnerYearsCubit extends Cubit<MultiWinnerYearsState> {
  MultiWinnerYearsCubit(this.multiWinnerYearsUseCase)
      : super(const MultiWinnerYearsInitial());

  final MultiWinnerYearsUseCase multiWinnerYearsUseCase;

  Future<void> getMultiWinnerYears() async {
    emit(const MultiWinnerYearsLoading());
    final result = await multiWinnerYearsUseCase();
    result.fold(
      (error) => emit(MultiWinnerYearsError(error.message)),
      (multiWinners) => emit(MultiWinnerYearsLoaded(multiWinners)),
    );
  }
}
