import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/multi_winner_years_usecases.dart';
import 'package:golden_raspberry_awards/features/movies/presentation/cubit/multi_winner_years/multi_winner_years_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../../../../_utils/mock/mocks.mocks.dart';

void main() {
  late final MultiWinnerYearsUseCase multiWinnerYearsUseCase;
  late final List<MultiWinnerYear> tListMultiWinnerYear;

  setUpAll(() {
    multiWinnerYearsUseCase = MockMultiWinnerYearsUseCase();
    tListMultiWinnerYear = [
      const MultiWinnerYear(year: 2000, wins: 1),
      const MultiWinnerYear(year: 2001, wins: 2),
    ];
  });

  blocTest<MultiWinnerYearsCubit, MultiWinnerYearsState>(
    'should emit [MultiWinnerYearsLoading, MultiWinnerYearsLoaded] when getMultiWinnerYears is called',
    build: () {
      provideDummy<Either<Failure, List<MultiWinnerYear>>>(
        Right(tListMultiWinnerYear),
      );

      when(
        multiWinnerYearsUseCase(),
      ).thenAnswer((_) async => Right(tListMultiWinnerYear));

      return MultiWinnerYearsCubit(multiWinnerYearsUseCase);
    },
    act: (bloc) => bloc.getMultiWinnerYears(),
    expect: () => [
      const MultiWinnerYearsLoading(),
      MultiWinnerYearsLoaded(tListMultiWinnerYear),
    ],
    verify: (_) {
      verify(multiWinnerYearsUseCase()).called(1);
    },
  );

  blocTest<MultiWinnerYearsCubit, MultiWinnerYearsState>(
    'should emit [MultiWinnerYearsLoading, MultiWinnerYearsError] when getMultiWinnerYears is called',
    build: () {
      provideDummy<Either<Failure, List<MultiWinnerYear>>>(
        const Left(ServerFailure('Server Failure')),
      );

      when(
        multiWinnerYearsUseCase(),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return MultiWinnerYearsCubit(multiWinnerYearsUseCase);
    },
    act: (bloc) => bloc.getMultiWinnerYears(),
    expect: () => [
      const MultiWinnerYearsLoading(),
      const MultiWinnerYearsError('Server Failure'),
    ],
    verify: (_) {
      verify(multiWinnerYearsUseCase()).called(1);
    },
  );
}
