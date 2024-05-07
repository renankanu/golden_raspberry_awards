import 'package:equatable/equatable.dart';

class ProducersIntervalWins extends Equatable {
  final String producer;
  final int interval;
  final int previousYear;
  final int followingYear;

  const ProducersIntervalWins({
    required this.producer,
    required this.interval,
    required this.previousYear,
    required this.followingYear,
  });

  @override
  List<Object?> get props => [
        producer,
        interval,
        previousYear,
        followingYear,
      ];
}
