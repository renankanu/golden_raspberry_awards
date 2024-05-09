import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/multi_winner_years_usecases.dart';
import 'package:mockito/mockito.dart';

import '../../../../_utils/mock/mocks.mocks.dart';

void main() {
  late MockMovieRepository repository;
  late MultiWinnerYearsUseCase usecase;
  late final List<MultiWinnerYear> tMultiWinnerYear;

  setUp(() {
    repository = MockMovieRepository();
    usecase = MultiWinnerYearsUseCase(repository);
    tMultiWinnerYear = [
      const MultiWinnerYear(year: 2019, wins: 2),
      const MultiWinnerYear(year: 2018, wins: 3),
    ];
    provideDummy<Either<Failure, List<MultiWinnerYear>>>(
      Right(tMultiWinnerYear),
    );
  });

  test('should get multi winner years from the repository', () async {
    // arrange
    when(repository.getMultiWinnerYears())
        .thenAnswer((_) async => Right(tMultiWinnerYear));
    // act
    final result = await usecase();
    // assert
    verify(repository.getMultiWinnerYears());
    expect(result, equals(Right(tMultiWinnerYear)));
    verifyNoMoreInteractions(repository);
  });
}
