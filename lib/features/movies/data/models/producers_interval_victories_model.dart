import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';
import 'producer_model.dart';

class ProducersIntervalVictoriesModel extends Equatable {
  const ProducersIntervalVictoriesModel({
    required this.min,
    required this.max,
  });

  final List<ProducerModel> min;
  final List<ProducerModel> max;

  factory ProducersIntervalVictoriesModel.fromJson(Map<String, dynamic> json) {
    return ProducersIntervalVictoriesModel(
      min: (json['min'] as List)
          .map((e) => ProducerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      max: (json['max'] as List)
          .map((e) => ProducerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  ProducersIntervalWins toEntity() {
    return ProducersIntervalWins(
      min: min.map((e) => e.toEntity()).toList(),
      max: max.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [min, max];
}
