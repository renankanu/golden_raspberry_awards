import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/movies/domain/repositories/movie_repository.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/producers_interval_victories_usecases.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'producers_interval_victories_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository repository;
  late ProducersIntervalVictoriesUseCase usecase;
  late final ProducersIntervalWins tProducerIntervalVictory;

  setUp(() {
    repository = MockMovieRepository();
    usecase = ProducersIntervalVictoriesUseCase(repository);
    tProducerIntervalVictory = const ProducersIntervalWins(
      min: [
        Producer(
          producer: 'Producer 1',
          interval: 200,
          followingWin: 2005,
          previousWin: 2003,
        ),
      ],
      max: [
        Producer(
          producer: 'Producer 2',
          interval: 2,
          followingWin: 2005,
          previousWin: 2003,
        ),
      ],
    );
    provideDummy<Either<Failure, ProducersIntervalWins>>(
      Right(tProducerIntervalVictory),
    );
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
