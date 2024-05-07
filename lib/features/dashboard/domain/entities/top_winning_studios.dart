import 'package:equatable/equatable.dart';

class TopWinningStudios extends Equatable {
  final String studio;
  final int wins;

  const TopWinningStudios({
    required this.studio,
    required this.wins,
  });

  @override
  List<Object?> get props => [studio, wins];
}
