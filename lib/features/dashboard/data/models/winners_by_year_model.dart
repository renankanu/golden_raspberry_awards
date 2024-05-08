import '../../domain/entities/entities.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.year,
    required super.title,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      year: json['year'] as int,
      title: json['title'] as String,
    );
  }
}
