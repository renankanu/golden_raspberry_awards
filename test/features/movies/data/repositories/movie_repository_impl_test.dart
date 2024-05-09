import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/features/movies/data/datasource/movie_datasource.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/models.dart';
import 'package:golden_raspberry_awards/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/movies/domain/repositories/movie_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateMocks([MovieDatasource])
void main() {
  late MockMovieDatasource datasource;
  late final MovieRepository repository;

  late final List<MultiWinnerYearModel> tListMultiWinnerYearModel;

  late final List<MultiWinnerYear> tListMultiWinnerYear;

  setUpAll(() {
    datasource = MockMovieDatasource();
    repository = MovieRepositoryImpl(remoteDatasource: datasource);

    tListMultiWinnerYearModel = [
      const MultiWinnerYearModel(year: 2000, wins: 1),
      const MultiWinnerYearModel(year: 2001, wins: 2),
    ];

    tListMultiWinnerYear = [
      const MultiWinnerYear(year: 2000, wins: 1),
      const MultiWinnerYear(year: 2001, wins: 2),
    ];
  });

  group('getMultiWinnerYears', () {
    test(
        'should return [List<MultiWinnerYear>] when the call to remote data source is successful',
        () async {
      // arrange
      when(datasource.getMultiWinnerYears())
          .thenAnswer((_) async => tListMultiWinnerYearModel);
      // act
      final result = await repository.getMultiWinnerYears();
      // assert
      expect(result.hashCode, equals(Right(tListMultiWinnerYear)).hashCode);
      verify(datasource.getMultiWinnerYears());
      verifyNoMoreInteractions(datasource);
    });
  });
}
