import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/winner_by_year_usecases.dart';
import 'package:golden_raspberry_awards/features/movies/presentation/cubit/search_by_year/search_by_year_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../../../../_utils/mock/mocks.mocks.dart';

void main() {
  late final WinnerByYearUseCase searchByYearUseCase;
  late final List<Movie> tWinnersByYear;

  setUpAll(() {
    searchByYearUseCase = MockWinnerByYearUseCase();
    tWinnersByYear = [
      const Movie(
        id: 1,
        year: 2019,
        title: 'winner one',
        isWinner: true,
      ),
      const Movie(
        id: 2,
        year: 2020,
        title: 'winner two',
        isWinner: false,
      ),
    ];
  });

  blocTest<SearchByYearCubit, SearchByYearState>(
    'should emit [WinnerByYearLoading, WinnerByYearLoaded] when getWinnersByYear is called',
    build: () {
      provideDummy<Either<Failure, List<Movie>>>(
        Right(tWinnersByYear),
      );

      when(
        searchByYearUseCase(2000),
      ).thenAnswer((_) async => Right(tWinnersByYear));

      return SearchByYearCubit(searchByYearUseCase);
    },
    act: (bloc) => bloc.getWinnerByYear(2000),
    expect: () => [
      const SearchByYearLoading(),
      SearchByYearLoaded(tWinnersByYear),
    ],
    verify: (_) {
      verify(searchByYearUseCase(2000)).called(1);
    },
  );

  blocTest<SearchByYearCubit, SearchByYearState>(
    'should emit [WinnerByYearLoading, WinnerByYearError] when getWinnersByYear is called',
    build: () {
      provideDummy<Either<Failure, List<Movie>>>(
        const Left(ServerFailure('Server Failure')),
      );

      when(
        searchByYearUseCase(2000),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return SearchByYearCubit(searchByYearUseCase);
    },
    act: (bloc) => bloc.getWinnerByYear(2000),
    expect: () => [
      const SearchByYearLoading(),
      const SearchByYearError('Server Failure'),
    ],
    verify: (_) {
      verify(searchByYearUseCase(2000)).called(1);
    },
  );
}
