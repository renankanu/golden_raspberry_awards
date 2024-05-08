import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/movie_repository.dart';

class WinnerByYearUseCase {
  WinnerByYearUseCase(this.repository);

  final MovieRepository repository;

  Future<Either<Failure, List<Movie>>> call(int year) async {
    return repository.getWinnersByYear(year);
  }
}
