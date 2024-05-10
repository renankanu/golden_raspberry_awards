import 'package:equatable/equatable.dart';

class Producer extends Equatable {
  const Producer({
    required this.producer,
    required this.interval,
    required this.followingWin,
    required this.previousWin,
  });

  final String producer;
  final int interval;
  final int followingWin;
  final int previousWin;

  @override
  List<Object?> get props => [producer, interval, followingWin, previousWin];
}
