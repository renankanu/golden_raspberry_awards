import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/dashboard_repository.dart';

class GetWinnerByYearUseCase {
  GetWinnerByYearUseCase(this.repository);

  final DashboardRepository repository;

  Future<Either<Failure, List<WinnersByYear>>> call(int year) async {
    return await repository.getWinnersByYear(year);
  }
}
