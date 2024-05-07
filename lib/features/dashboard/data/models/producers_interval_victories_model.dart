import '../../domain/entities/entities.dart';
import 'producer_model.dart';

class ProducersIntervalVictoriesModel extends ProducersIntervalWins {
  const ProducersIntervalVictoriesModel({
    required super.min,
    required super.max,
  });

  factory ProducersIntervalVictoriesModel.fromJson(Map<String, dynamic> json) {
    return ProducersIntervalVictoriesModel(
      min: (json['min'] as List).map((e) => ProducerModel.fromJson(e)).toList(),
      max: (json['max'] as List).map((e) => ProducerModel.fromJson(e)).toList(),
    );
  }
}
