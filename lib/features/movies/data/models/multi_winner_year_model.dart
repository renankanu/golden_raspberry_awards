import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class MultiWinnerYearModel extends Equatable {
  const MultiWinnerYearModel({
    required this.year,
    required this.wins,
  });

  final int year;
  final int wins;

  factory MultiWinnerYearModel.fromJson(Map<String, dynamic> json) {
    return MultiWinnerYearModel(
      year: json['year'] as int,
      wins: json['winnerCount'] as int,
    );
  }

  MultiWinnerYear toEntity() {
    return MultiWinnerYear(
      year: year,
      wins: wins,
    );
  }

  @override
  List<Object?> get props => [year, wins];
}
