import 'package:equatable/equatable.dart';

class TopWinningStudios extends Equatable {
  const TopWinningStudios({
    required this.studio,
    required this.wins,
  });

  final String studio;
  final int wins;

  @override
  List<Object?> get props => [studio, wins];
}
