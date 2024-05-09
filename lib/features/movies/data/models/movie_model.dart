import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class MovieModel extends Equatable {
  const MovieModel({
    required this.id,
    required this.year,
    required this.title,
    required this.isWinner,
  });

  final int id;
  final int year;
  final String title;
  final bool isWinner;

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      year: json['year'] as int,
      title: json['title'] as String,
      isWinner: json['winner'] as bool,
    );
  }

  Movie toEntity() {
    return Movie(
      id: id,
      year: year,
      title: title,
      isWinner: isWinner,
    );
  }

  @override
  List<Object?> get props => [id, year, title, isWinner];
}
