import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/movie_repository.dart';

class MultiWinnerYearsUseCase {
  MultiWinnerYearsUseCase(this.repository);

  final MovieRepository repository;

  Future<Either<Failure, List<MultiWinnerYear>>> call() async {
    return repository.getMultiWinnerYears();
  }
}
