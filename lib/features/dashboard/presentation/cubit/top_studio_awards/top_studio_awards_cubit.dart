import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_top_winning_studios.dart';

part 'top_studio_awards_state.dart';

class TopStudioAwardsCubit extends Cubit<TopStudioAwardsState> {
  TopStudioAwardsCubit(this.topWinningStudiosUseCase)
      : super(const TopStudioAwardsInitial());
  final GetTopWinningStudiosUseCase topWinningStudiosUseCase;

  Future<void> getTopStudioAwards() async {
    emit(const TopStudioAwardsLoading());
    final result = await topWinningStudiosUseCase();
    result.fold(
      (error) => emit(TopStudioAwardsError(error.message)),
      (topWinningStudios) => emit(TopStudioAwardsLoaded(topWinningStudios)),
    );
  }
}
