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
  final List<TopWinningStudios> topStudioAwards;
  const TopStudioAwardsLoaded(this.topStudioAwards);

  @override
  List<Object> get props => [topStudioAwards];
}

class TopStudioAwardsError extends TopStudioAwardsState {
  final String message;
  const TopStudioAwardsError(this.message);

  @override
  List<Object> get props => [message];
}
