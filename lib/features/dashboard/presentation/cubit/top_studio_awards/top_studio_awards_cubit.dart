import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/usecases/get_top_winning_studios.dart';

import '../../../domain/entities/entities.dart';

part 'top_studio_awards_state.dart';

class TopStudioAwardsCubit extends Cubit<TopStudioAwardsState> {
  final GetTopWinningStudiosUseCase topWinningStudiosUseCase;

  TopStudioAwardsCubit(this.topWinningStudiosUseCase)
      : super(const TopStudioAwardsInitial());

  Future<void> getTopStudioAwards() async {
    emit(const TopStudioAwardsLoading());
    final result = await topWinningStudiosUseCase();
    result.fold(
      (error) => emit(TopStudioAwardsError(error.message)),
      (topWinningStudios) => emit(TopStudioAwardsLoaded(topWinningStudios)),
    );
  }
}
