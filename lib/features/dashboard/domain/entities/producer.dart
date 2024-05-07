import 'package:equatable/equatable.dart';

class Producer extends Equatable {
  final String producer;
  final int interval;
  final int followingWin;
  final int previousWin;

  const Producer({
    required this.producer,
    required this.interval,
    required this.followingWin,
    required this.previousWin,
  });

  @override
  List<Object?> get props => [
        producer,
        interval,
        followingWin,
        previousWin,
      ];
}
