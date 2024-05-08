import 'package:equatable/equatable.dart';

class WinnersByYear extends Equatable {
  const WinnersByYear({
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
