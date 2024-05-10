import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/top_winning_studios_usecases.dart';
import 'package:golden_raspberry_awards/features/movies/presentation/cubit/top_studio_awards/top_studio_awards_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../../../../_utils/mock/mocks.mocks.dart';

void main() {
  late final TopWinningStudiosUseCase topWinningStudiosUseCase;
  late final List<TopWinningStudios> tTopWinningStudios;

  setUpAll(() {
    topWinningStudiosUseCase = MockTopWinningStudiosUseCase();
    tTopWinningStudios = [
      const TopWinningStudios(
        studio: 'studio one',
        wins: 1,
      ),
      const TopWinningStudios(
        studio: 'studio two',
        wins: 2,
      ),
    ];
  });

  blocTest<TopStudioAwardsCubit, TopStudioAwardsState>(
    'should emit [TopWinningStudiosLoading, TopWinningStudiosLoaded] when getTopWinningStudios is called',
    build: () {
      provideDummy<Either<Failure, List<TopWinningStudios>>>(
        Right(tTopWinningStudios),
      );

      when(
        topWinningStudiosUseCase(),
      ).thenAnswer((_) async => Right(tTopWinningStudios));

      return TopStudioAwardsCubit(topWinningStudiosUseCase);
    },
    act: (bloc) => bloc.getTopStudioAwards(),
    expect: () => [
      const TopStudioAwardsLoading(),
      TopStudioAwardsLoaded(tTopWinningStudios),
    ],
    verify: (_) {
      verify(topWinningStudiosUseCase()).called(1);
    },
  );

  blocTest<TopStudioAwardsCubit, TopStudioAwardsState>(
    'should emit [TopWinningStudiosLoading, TopWinningStudiosError] when getTopWinningStudios is called',
    build: () {
      provideDummy<Either<Failure, List<TopWinningStudios>>>(
        const Left(ServerFailure('Server Failure')),
      );

      when(
        topWinningStudiosUseCase(),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return TopStudioAwardsCubit(topWinningStudiosUseCase);
    },
    act: (bloc) => bloc.getTopStudioAwards(),
    expect: () => [
      const TopStudioAwardsLoading(),
      const TopStudioAwardsError('Server Failure'),
    ],
    verify: (_) {
      verify(topWinningStudiosUseCase()).called(1);
    },
  );
}
