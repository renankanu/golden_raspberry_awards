import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/repositories/movie_repository.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/usecases/top_winning_studios_usecases.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'top_winning_studios_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository repository;
  late TopWinningStudiosUseCase usecase;
  late final List<TopWinningStudios> tTopWinningStudios;

  setUp(() {
    repository = MockMovieRepository();
    usecase = TopWinningStudiosUseCase(repository);
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
    provideDummy<Either<Failure, List<TopWinningStudios>>>(
      Right(tTopWinningStudios),
    );
  });

  test('should get top winning studios from the repository', () async {
    // arrange
    when(repository.getTopWinningStudios())
        .thenAnswer((_) async => Right(tTopWinningStudios));
    // act
    final result = await usecase();
    // assert
    expect(result, Right(tTopWinningStudios));
    verify(repository.getTopWinningStudios());
    verifyNoMoreInteractions(repository);
  });
}