import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/usecases/get_multi_winner_years.dart';

part 'get_multi_winner_years_state.dart';

class GetMultiWinnerYearsCubit extends Cubit<GetMultiWinnerYearsState> {
  final GetMultiWinnerYearsUseCase multiWinnerYearsUseCase;

  GetMultiWinnerYearsCubit(this.multiWinnerYearsUseCase)
      : super(const GetMultiWinnerYearsInitial());

  Future<void> getMultiWinnerYears() async {
    // emit(const GetMultiWinnerYearsLoading());
    // final result = await multiWinnerYearsUseCase();
    // result.fold(
    //   (error) => emit(GetMultiWinnerYearsError(error.message)),
    //   (multiWinners) => emit(GetMultiWinnerYearsLoaded(multiWinners)),
    // );
  }
}
