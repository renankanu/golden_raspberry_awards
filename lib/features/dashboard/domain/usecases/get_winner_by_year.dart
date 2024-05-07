import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/dashboard_repository.dart';

class GetWinnerByYear {
  final DashboardRepository repository;

  GetWinnerByYear(this.repository);

  Future<Either<Failure, List<WinnersByYear>>> call() async {
    return await repository.getWinnersByYear();
  }
}
