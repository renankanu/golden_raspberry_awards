import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/producers_interval_victories_usecases.dart';
import 'package:golden_raspberry_awards/features/movies/presentation/cubit/producers_interval_wins/producers_interval_wins_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../../../../_utils/mock/mocks.mocks.dart';

void main() {
  late final ProducersIntervalVictoriesUseCase producersIntervalWinsUseCase;
  late final ProducersIntervalWins tProducerIntervalVictory;

  setUpAll(() {
    producersIntervalWinsUseCase = MockProducersIntervalVictoriesUseCase();
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
  });

  blocTest<ProducersIntervalWinsCubit, ProducersIntervalWinsState>(
    'should emit [ProducersIntervalWinsLoading, ProducersIntervalWinsLoaded] when getProducersIntervalWins is called',
    build: () {
      provideDummy<Either<Failure, ProducersIntervalWins>>(
        Right(tProducerIntervalVictory),
      );

      when(
        producersIntervalWinsUseCase(),
      ).thenAnswer((_) async => Right(tProducerIntervalVictory));

      return ProducersIntervalWinsCubit(producersIntervalWinsUseCase);
    },
    act: (bloc) => bloc.getProducersIntervalWins(),
    expect: () => [
      const ProducersIntervalWinsLoading(),
      ProducersIntervalWinsLoaded(tProducerIntervalVictory),
    ],
    verify: (_) {
      verify(producersIntervalWinsUseCase()).called(1);
    },
  );

  blocTest<ProducersIntervalWinsCubit, ProducersIntervalWinsState>(
    'should emit [ProducersIntervalWinsLoading, ProducersIntervalWinsError] when getProducersIntervalWins is called',
    build: () {
      provideDummy<Either<Failure, ProducersIntervalWins>>(
        const Left(ServerFailure('Server Failure')),
      );

      when(
        producersIntervalWinsUseCase(),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return ProducersIntervalWinsCubit(producersIntervalWinsUseCase);
    },
    act: (bloc) => bloc.getProducersIntervalWins(),
    expect: () => [
      const ProducersIntervalWinsLoading(),
      const ProducersIntervalWinsError('Server Failure'),
    ],
    verify: (_) {
      verify(producersIntervalWinsUseCase()).called(1);
    },
  );
}
