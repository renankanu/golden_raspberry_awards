import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasource/remote_datasource.dart';

class DashboardRepositoryImpl implements DashboardRepository {
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
  Future<Either<Failure, List<WinnersByYear>>> getWinnersByYear(
    int year,
  ) async {
    try {
      final result = await remoteDatasource.getWinnersByYear(year);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server Failure in get winners by year'));
    }
  }
}
