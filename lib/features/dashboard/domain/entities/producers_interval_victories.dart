import 'package:equatable/equatable.dart';

class ProducersIntervalVictories extends Equatable {
  final String producer;
  final int interval;
  final int previousYear;
  final int followingYear;

  const ProducersIntervalVictories({
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
