import '../../domain/entities/producer.dart';

class ProducerModel extends Producer {
  const ProducerModel({
    required super.producer,
    required super.interval,
    required super.followingWin,
    required super.previousWin,
  });

  factory ProducerModel.fromJson(Map<String, dynamic> json) {
    return ProducerModel(
      producer: json['producer'],
      interval: json['interval'],
      followingWin: json['followingWin'],
      previousWin: json['previousWin'],
    );
  }
}
