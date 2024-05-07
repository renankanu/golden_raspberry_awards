import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/usecases/get_multi_winner_years.dart';

part 'multi_winner_years_state.dart';

class MultiWinnerYearsCubit extends Cubit<MultiWinnerYearsState> {
  final GetMultiWinnerYearsUseCase multiWinnerYearsUseCase;

  MultiWinnerYearsCubit(this.multiWinnerYearsUseCase)
      : super(const MultiWinnerYearsInitial());

  Future<void> getMultiWinnerYears() async {
    emit(const MultiWinnerYearsLoading());
    final result = await multiWinnerYearsUseCase();
    result.fold(
      (error) => emit(MultiWinnerYearsError(error.message)),
      (multiWinners) => emit(MultiWinnerYearsLoaded(multiWinners)),
    );
  }
}
