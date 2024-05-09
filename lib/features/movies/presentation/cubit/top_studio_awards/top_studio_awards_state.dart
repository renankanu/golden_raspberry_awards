part of 'top_studio_awards_cubit.dart';

class TopStudioAwardsState extends Equatable {
  const TopStudioAwardsState();

  @override
  List<Object> get props => [];
}

class TopStudioAwardsInitial extends TopStudioAwardsState {
  const TopStudioAwardsInitial();
}

class TopStudioAwardsLoading extends TopStudioAwardsState {
  const TopStudioAwardsLoading();
}

class TopStudioAwardsLoaded extends TopStudioAwardsState {
  const TopStudioAwardsLoaded(this.topStudioAwards);

  final List<TopWinningStudios> topStudioAwards;

  @override
  List<Object> get props => [topStudioAwards];
}

class TopStudioAwardsError extends TopStudioAwardsState {
  const TopStudioAwardsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
