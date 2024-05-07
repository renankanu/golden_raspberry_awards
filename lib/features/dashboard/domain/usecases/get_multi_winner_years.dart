import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/dashboard_repository.dart';

class GetMultiWinnerYears {
  final DashboardRepository repository;

  GetMultiWinnerYears(this.repository);

  Future<Either<Failure, List<MultiWinnerYear>>> call() async {
    return await repository.getMultiWinnerYears();
  }
}
