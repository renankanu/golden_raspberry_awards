import 'package:equatable/equatable.dart';

class MultiWinnerYear extends Equatable {
  final int year;
  final int wins;

  const MultiWinnerYear({
    required this.year,
    required this.wins,
  });

  @override
  List<Object?> get props => [year, wins];
}
