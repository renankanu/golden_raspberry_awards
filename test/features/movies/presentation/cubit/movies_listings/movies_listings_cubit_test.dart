import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/movie_usecases.dart';
import 'package:golden_raspberry_awards/features/movies/presentation/cubit/movies_listings/movies_listings_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../../../../_utils/mock/mocks.mocks.dart';

void main() {
  late final MovieUsecase movieUsecases;
  late final MoviesListings tMoviesListings;

  setUpAll(() {
    movieUsecases = MockMovieUsecase();

    tMoviesListings = const MoviesListings(
      movies: [
        Movie(
          id: 1,
          year: 2000,
          title: 'Batman',
          isWinner: true,
        ),
      ],
      page: 1,
      totalPages: 1,
      totalElements: 1,
    );
  });

  blocTest<MoviesListingsCubit, MoviesListingsState>(
    'should emit [MoviesListingsLoading, MoviesListingsLoaded] when getMovies is called',
    build: () {
      provideDummy<Either<Failure, MoviesListings>>(
        Right(tMoviesListings),
      );

      when(
        movieUsecases(page: 0, size: 20),
      ).thenAnswer((_) async => Right(tMoviesListings));

      return MoviesListingsCubit(movieUsecases);
    },
    act: (bloc) => bloc.getMovies(),
    expect: () => [
      const MoviesListingsLoading(),
      MoviesListingsLoaded(List.of(tMoviesListings.movies)),
    ],
    verify: (_) {
      verify(movieUsecases(page: 0, size: 20)).called(1);
    },
  );

  blocTest<MoviesListingsCubit, MoviesListingsState>(
    'should emit [MoviesListingsLoading, MoviesListingsError] when getMovies is called',
    build: () {
      provideDummy<Either<Failure, MoviesListings>>(
        const Left(ServerFailure('error')),
      );

      when(
        movieUsecases(page: 0, size: 20),
      ).thenAnswer((_) async => const Left(ServerFailure('error')));

      return MoviesListingsCubit(movieUsecases);
    },
    act: (bloc) => bloc.getMovies(),
    expect: () => [
      const MoviesListingsLoading(),
      const MoviesListingsError('error'),
    ],
    verify: (_) {
      verify(movieUsecases(page: 0, size: 20)).called(1);
    },
  );

  blocTest<MoviesListingsCubit, MoviesListingsState>(
    'should emit [MoviesListingsLoaded, MoviesListingsLoaded] when filterMovies is called',
    build: () {
      provideDummy<Either<Failure, MoviesListings>>(
        Right(tMoviesListings),
      );

      when(
        movieUsecases(page: 0, size: 20, year: 2000, isWinner: true),
      ).thenAnswer((_) async => Right(tMoviesListings));

      return MoviesListingsCubit(movieUsecases);
    },
    act: (bloc) => bloc.filterMovies(isWinner: true, year: 2000),
    expect: () => [
      const MoviesListingsLoaded([]),
      MoviesListingsLoaded(List.of(tMoviesListings.movies)),
    ],
    verify: (_) {
      verify(movieUsecases(page: 0, size: 20, year: 2000, isWinner: true))
          .called(1);
    },
  );
}
