import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/dashboard_repository.dart';

class GetProducersIntervalVictories {
  final DashboardRepository repository;

  GetProducersIntervalVictories(this.repository);

  Future<Either<Failure, List<ProducersIntervalVictories>>> call() async {
    return await repository.getProducersIntervalVictories();
  }
}
