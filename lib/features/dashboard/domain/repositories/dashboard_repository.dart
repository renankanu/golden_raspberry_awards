import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/errors/failure.dart';

import '../entities/entities.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<MultiWinnerYear>>> getMultiWinnerYears();
  Future<Either<Failure, List<ProducersIntervalWins>>>
      getProducersIntervalVictories();
  Future<Either<Failure, List<WinnersByYear>>> getWinnersByYear();
  Future<Either<Failure, List<TopWinningStudios>>> getTopWinningStudios();
}
