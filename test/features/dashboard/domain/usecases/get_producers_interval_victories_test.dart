import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/usecases/get_producers_interval_victories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_producers_interval_victories_test.mocks.dart';

@GenerateMocks([DashboardRepository])
void main() {
  late MockDashboardRepository repository;
  late GetProducersIntervalVictories usecase;
  late final List<ProducersIntervalVictories> tProducerIntervalVictory;

  setUp(() {
    repository = MockDashboardRepository();
    usecase = GetProducersIntervalVictories(repository);
    tProducerIntervalVictory = [
      const ProducersIntervalVictories(
        producer: 'producer one',
        interval: 1,
        previousYear: 2019,
        followingYear: 2020,
      ),
      const ProducersIntervalVictories(
        producer: 'producer two',
        interval: 2,
        previousYear: 2018,
        followingYear: 2019,
      ),
    ];
    provideDummy<Either<Failure, List<ProducersIntervalVictories>>>(
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
