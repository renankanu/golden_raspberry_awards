import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';

class MultiWinnerYearModel extends MultiWinnerYear {
  const MultiWinnerYearModel({
    required super.year,
    required super.wins,
  });

  factory MultiWinnerYearModel.fromJson(Map<String, dynamic> json) {
    return MultiWinnerYearModel(
      year: json['year'],
      wins: json['wins'],
    );
  }
}