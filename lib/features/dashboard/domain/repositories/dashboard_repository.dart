import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';

import '../entities/entities.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<MultiWinnerYear>>> getMultiWinnerYears();
  Future<Either<Failure, ProducersIntervalWins>>
      getProducersIntervalVictories();
  Future<Either<Failure, List<WinnersByYear>>> getWinnersByYear(int year);
  Future<Either<Failure, List<TopWinningStudios>>> getTopWinningStudios();
}
