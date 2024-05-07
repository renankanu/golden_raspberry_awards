import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/dashboard_repository.dart';

class GetWinnerByYearUseCase {
  final DashboardRepository repository;

  GetWinnerByYearUseCase(this.repository);

  Future<Either<Failure, List<WinnersByYear>>> call() async {
    return await repository.getWinnersByYear();
  }
}
