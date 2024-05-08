import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/movie_repository.dart';

class TopWinningStudiosUseCase {
  TopWinningStudiosUseCase(this.repository);

  final MovieRepository repository;

  Future<Either<Failure, List<TopWinningStudios>>> call() async {
    return repository.getTopWinningStudios();
  }
}
