import '../../domain/entities/entities.dart';

class TopWinningStudiosModel extends TopWinningStudios {
  const TopWinningStudiosModel({
    required super.studio,
    required super.wins,
  });

  factory TopWinningStudiosModel.fromJson(Map<String, dynamic> json) {
    return TopWinningStudiosModel(
      studio: json['name'] as String,
      wins: json['winCount'] as int,
    );
  }
}
