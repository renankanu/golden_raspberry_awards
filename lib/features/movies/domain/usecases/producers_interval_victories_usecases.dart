import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/movie_repository.dart';

class ProducersIntervalVictoriesUseCase {
  ProducersIntervalVictoriesUseCase(this.repository);

  final MovieRepository repository;

  Future<Either<Failure, ProducersIntervalWins>> call() async {
    return repository.getProducersIntervalVictories();
  }
}
