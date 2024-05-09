import '../../domain/entities/entities.dart';

class MultiWinnerYearModel extends MultiWinnerYear {
  const MultiWinnerYearModel({
    required super.year,
    required super.wins,
  });

  factory MultiWinnerYearModel.fromJson(Map<String, dynamic> json) {
    return MultiWinnerYearModel(
      year: json['year'] as int,
      wins: json['winnerCount'] as int,
    );
  }
}
