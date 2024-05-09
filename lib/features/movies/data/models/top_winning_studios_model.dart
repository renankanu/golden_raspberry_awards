import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class TopWinningStudiosModel extends Equatable {
  const TopWinningStudiosModel({
    required this.studio,
    required this.wins,
  });

  final String studio;
  final int wins;

  factory TopWinningStudiosModel.fromJson(Map<String, dynamic> json) {
    return TopWinningStudiosModel(
      studio: json['name'] as String,
      wins: json['winCount'] as int,
    );
  }

  TopWinningStudios toEntity() {
    return TopWinningStudios(
      studio: studio,
      wins: wins,
    );
  }

  @override
  List<Object?> get props => [studio, wins];
}
