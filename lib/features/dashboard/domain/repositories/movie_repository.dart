import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/entities.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MultiWinnerYear>>> getMultiWinnerYears();
  Future<Either<Failure, ProducersIntervalWins>>
      getProducersIntervalVictories();
  Future<Either<Failure, List<Movie>>> getWinnersByYear(int year);
  Future<Either<Failure, List<TopWinningStudios>>> getTopWinningStudios();
  Future<Either<Failure, MoviesListings>> getMovies({required int page});
}
