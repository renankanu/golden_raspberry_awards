import '../../domain/entities/entities.dart';

class ProducersIntervalVictoriesModel extends ProducersIntervalVictories {
  const ProducersIntervalVictoriesModel({
    required super.producer,
    required super.interval,
    required super.previousYear,
    required super.followingYear,
  });

  factory ProducersIntervalVictoriesModel.fromJson(Map<String, dynamic> json) {
    return ProducersIntervalVictoriesModel(
      producer: json['producer'],
      interval: json['interval'],
      previousYear: json['previousYear'],
      followingYear: json['followingYear'],
    );
  }
}
