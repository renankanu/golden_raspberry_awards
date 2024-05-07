import '../../domain/entities/entities.dart';

class WinnersByYearModel extends WinnersByYear {
  const WinnersByYearModel({
    required super.id,
    required super.year,
    required super.title,
  });

  factory WinnersByYearModel.fromJson(Map<String, dynamic> json) {
    return WinnersByYearModel(
      id: json['id'],
      year: json['year'],
      title: json['title'],
    );
  }
}
