import 'package:equatable/equatable.dart';

class MultiWinnerYear extends Equatable {
  const MultiWinnerYear({
    required this.year,
    required this.wins,
  });

  final int year;
  final int wins;

  @override
  List<Object?> get props => [year, wins];
}
