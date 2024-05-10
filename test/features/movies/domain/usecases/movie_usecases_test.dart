import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/movie_usecases.dart';
import 'package:mockito/mockito.dart';

import '../../../../_utils/mock/mocks.mocks.dart';

void main() {
  late MockMovieRepository repository;
  late MovieUsecase usecase;
  late final MoviesListings tMoviesListings;

  setUp(() {
    repository = MockMovieRepository();
    usecase = MovieUsecase(repository);
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
    provideDummy<Either<Failure, MoviesListings>>(
      Right(tMoviesListings),
    );
  });

  test('should get multi winner years from the repository', () async {
    // arrange
    when(repository.getMovies(page: 1, size: 1))
        .thenAnswer((_) async => Right(tMoviesListings));
    // act
    final result = await usecase(page: 1, size: 1);
    // assert
    expect(result, equals(Right(tMoviesListings)));
    verify(repository.getMovies(page: 1, size: 1));
    verifyNoMoreInteractions(repository);
  });
}
