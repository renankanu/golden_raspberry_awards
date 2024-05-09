import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/top_winning_studios_usecases.dart';

part 'top_studio_awards_state.dart';

class TopStudioAwardsCubit extends Cubit<TopStudioAwardsState> {
  TopStudioAwardsCubit(this.topWinningStudiosUseCase)
      : super(const TopStudioAwardsInitial());
  final TopWinningStudiosUseCase topWinningStudiosUseCase;

  Future<void> getTopStudioAwards() async {
    emit(const TopStudioAwardsLoading());
    final result = await topWinningStudiosUseCase();
    result.fold(
      (error) => emit(TopStudioAwardsError(error.message)),
      (success) => emit(TopStudioAwardsLoaded(success)),
    );
  }
}
