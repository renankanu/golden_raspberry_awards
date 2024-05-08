import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie({
    required this.id,
    required this.year,
    required this.title,
  });

  final int id;
  final int year;
  final String title;

  @override
  List<Object?> get props => [id, year, title];
}
