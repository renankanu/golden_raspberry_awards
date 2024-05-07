import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/producer.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/usecases/get_producers_interval_victories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_producers_interval_victories_test.mocks.dart';

@GenerateMocks([DashboardRepository])
void main() {
  late MockDashboardRepository repository;
  late GetProducersIntervalVictoriesUseCase usecase;
  late final ProducersIntervalWins tProducerIntervalVictory;

  setUp(() {
    repository = MockDashboardRepository();
    usecase = GetProducersIntervalVictoriesUseCase(repository);
    tProducerIntervalVictory = const ProducersIntervalWins(
      min: [
        Producer(
          producer: 'Producer 1',
          interval: 200,
          followingWin: 2005,
          previousWin: 2003,
        )
      ],
      max: [
        Producer(
          producer: 'Producer 2',
          interval: 2,
          followingWin: 2005,
          previousWin: 2003,
        )
      ],
    );
    provideDummy<Either<Failure, ProducersIntervalWins>>(
        Right(tProducerIntervalVictory));
  });

  test('should get producers interval victories from the repository', () async {
    // arrange
    when(repository.getProducersIntervalVictories())
        .thenAnswer((_) async => Right(tProducerIntervalVictory));
    // act
    final result = await usecase();
    // assert
    expect(result, Right(tProducerIntervalVictory));
    verify(repository.getProducersIntervalVictories());
    verifyNoMoreInteractions(repository);
  });
}
