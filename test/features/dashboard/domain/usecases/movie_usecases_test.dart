import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/repositories/movie_repository.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/usecases/movie_usecases.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_usecases_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository repository;
  late MovieUsecases usecase;
  late final MoviesListings tMoviesListings;

  setUp(() {
    repository = MockMovieRepository();
    usecase = MovieUsecases(repository);
    tMoviesListings = const MoviesListings(
      movies: [],
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
    when(repository.getMovies(page: 1))
        .thenAnswer((_) async => Right(tMoviesListings));
    // act
    final result = await usecase(page: 1);
    // assert
    expect(result, Right(tMoviesListings));
    verify(repository.getMovies(page: 1));
    verifyNoMoreInteractions(repository);
  });
}
