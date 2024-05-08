import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasource/remote_datasource.dart';

class DashboardRepositoryImpl implements MovieRepository {
  DashboardRepositoryImpl({required this.remoteDatasource});

  final RemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, List<MultiWinnerYear>>> getMultiWinnerYears() async {
    try {
      final result = await remoteDatasource.getMultiWinnerYears();
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Server Failure in get multi winner years'),
      );
    }
  }

  @override
  Future<Either<Failure, ProducersIntervalWins>>
      getProducersIntervalVictories() async {
    try {
      final result = await remoteDatasource.getProducersIntervalVictories();
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Server Failure in get producers interval victories'),
      );
    }
  }

  @override
  Future<Either<Failure, List<TopWinningStudios>>>
      getTopWinningStudios() async {
    try {
      final result = await remoteDatasource.getTopWinningStudios();
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Server Failure in get top winning studios'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getWinnersByYear(
    int year,
  ) async {
    try {
      final result = await remoteDatasource.getWinnersByYear(year);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server Failure in get winners by year'));
    }
  }

  @override
  Future<Either<Failure, MoviesListings>> getMovies({
    required int page,
    required int size,
    int? year,
    bool? isWinner,
  }) async {
    try {
      final result = await remoteDatasource.getMovies(page: page, size: size);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server Failure in get movies'));
    }
  }
}
