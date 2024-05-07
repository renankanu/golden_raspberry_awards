import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/dashboard_repository.dart';

class GetTopWinningStudiosUseCase {
  final DashboardRepository repository;

  GetTopWinningStudiosUseCase(this.repository);

  Future<Either<Failure, List<TopWinningStudios>>> call() async {
    return await repository.getTopWinningStudios();
  }
}
