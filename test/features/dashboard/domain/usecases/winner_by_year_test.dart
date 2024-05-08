import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/repositories/movie_repository.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/usecases/winner_by_year_usecases.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'winner_by_year_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository repository;
  late WinnerByYearUseCase usecase;
  late final List<Movie> tWinnersByYear;

  setUp(() {
    repository = MockMovieRepository();
    usecase = WinnerByYearUseCase(repository);
    tWinnersByYear = [
      const Movie(
        id: 1,
        year: 2019,
        title: 'winner one',
      ),
      const Movie(
        id: 2,
        year: 2020,
        title: 'winner two',
      ),
    ];
    provideDummy<Either<Failure, List<Movie>>>(Right(tWinnersByYear));
  });

  test('should get winners by year from the repository', () async {
    // arrange
    when(repository.getWinnersByYear(2000))
        .thenAnswer((_) async => Right(tWinnersByYear));
    // act
    final result = await usecase(2000);
    // assert
    expect(result, Right(tWinnersByYear));
    verify(repository.getWinnersByYear(2000));
    verifyNoMoreInteractions(repository);
  });
}
