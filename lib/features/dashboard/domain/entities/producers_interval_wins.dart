import 'package:equatable/equatable.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/producer.dart';

class ProducersIntervalWins extends Equatable {
  const ProducersIntervalWins({
    required this.min,
    required this.max,
  });

  final List<Producer> min;
  final List<Producer> max;

  @override
  List<Object?> get props => [
        min,
        max,
      ];
}
