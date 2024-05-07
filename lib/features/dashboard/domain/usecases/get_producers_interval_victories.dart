import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/dashboard_repository.dart';

class GetProducersIntervalVictoriesUseCase {
  final DashboardRepository repository;

  GetProducersIntervalVictoriesUseCase(this.repository);

  Future<Either<Failure, ProducersIntervalWins>> call() async {
    return await repository.getProducersIntervalVictories();
  }
}
