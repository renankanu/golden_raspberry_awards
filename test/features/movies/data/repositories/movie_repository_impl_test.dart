import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/models.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/producer_model.dart';
import 'package:golden_raspberry_awards/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';
import 'package:mockito/mockito.dart';

import '../../../../_utils/mock/mocks.mocks.dart';

void main() {
  late MockMovieDatasource datasource;
  late final MovieRepositoryImpl repository;

  late final List<MultiWinnerYearModel> tListMultiWinnerYearModel;
  late final ProducersIntervalVictoriesModel tProducersIntervalVictoriesModel;
  late final List<MovieModel> tListMovieModel;
  late final List<TopWinningStudiosModel> tListTopWinningStudiosModel;
  late final MovieListingsModel tMovieListingsModel;

  late final List<MultiWinnerYear> tListMultiWinnerYear;
  late final ProducersIntervalWins tProducersIntervalVictories;
  late final List<Movie> tListMovie;
  late final List<TopWinningStudios> tListTopWinningStudios;
  late final MoviesListings tMoviesListings;

  setUpAll(() {
    datasource = MockMovieDatasource();
    repository = MovieRepositoryImpl(remoteDatasource: datasource);

    tListMultiWinnerYearModel = [
      const MultiWinnerYearModel(year: 2000, wins: 1),
      const MultiWinnerYearModel(year: 2001, wins: 2),
    ];
    tProducersIntervalVictoriesModel = const ProducersIntervalVictoriesModel(
      min: [
        ProducerModel(
          producer: 'John Doe',
          interval: 1,
          previousWin: 2000,
          followingWin: 2001,
        ),
      ],
      max: [
        ProducerModel(
          producer: 'Jane Doe',
          interval: 2,
          previousWin: 2000,
          followingWin: 2002,
        ),
      ],
    );
    tListMovieModel = [
      const MovieModel(
        id: 1,
        year: 2000,
        title: 'Batman',
        isWinner: true,
      ),
    ];
    tListTopWinningStudiosModel = [
      const TopWinningStudiosModel(studio: 'John Doe', wins: 1),
      const TopWinningStudiosModel(studio: 'Jane Doe', wins: 2),
    ];
    tMovieListingsModel = MovieListingsModel(
      page: 1,
      movies: tListMovieModel,
      totalPages: 1,
      totalElements: 1,
    );

    tListMultiWinnerYear = tListMultiWinnerYearModel;
    tProducersIntervalVictories = tProducersIntervalVictoriesModel;
    tListMovie = tListMovieModel;
    tListTopWinningStudios = tListTopWinningStudiosModel;
    tMoviesListings = tMovieListingsModel;
  });

  group('getMultiWinnerYears', () {
    test(
        'should return MultiWinnerYears when the call to datasource is successful',
        () async {
      // arrange
      when(datasource.getMultiWinnerYears())
          .thenAnswer((_) async => tListMultiWinnerYearModel);
      // act
      final result = await repository.getMultiWinnerYears();

      // assert
      expect(result, equals(Right(tListMultiWinnerYear)));
      verify(datasource.getMultiWinnerYears());
      verifyNoMoreInteractions(datasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful',
        () async {
      //arrange
      when(datasource.getMultiWinnerYears()).thenThrow(ServerException());
      // act
      final result = await repository.getMultiWinnerYears();

      // assert
      verify(datasource.getMultiWinnerYears());
      expect(
        result,
        equals(
          const Left(
            ServerFailure('Server Failure in get multi winner years'),
          ),
        ),
      );
    });
  });

  group('getProducersIntervalVictories', () {
    test(
        'should return ProducersIntervalWins when the call to datasource is successful',
        () async {
      // arrange
      when(datasource.getProducersIntervalVictories())
          .thenAnswer((_) async => tProducersIntervalVictoriesModel);
      // act
      final result = await repository.getProducersIntervalVictories();

      // assert
      expect(result, equals(Right(tProducersIntervalVictories)));
      verify(datasource.getProducersIntervalVictories());
      verifyNoMoreInteractions(datasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful',
        () async {
      //arrange
      when(datasource.getProducersIntervalVictories())
          .thenThrow(ServerException());
      // act
      final result = await repository.getProducersIntervalVictories();

      // assert
      verify(datasource.getProducersIntervalVictories());
      expect(
        result,
        equals(
          const Left(
            ServerFailure(
              'Server Failure in get producers interval victories',
            ),
          ),
        ),
      );
    });
  });

  group('getTopWinningStudios', () {
    test(
        'should return TopWinningStudios when the call to datasource is successful',
        () async {
      // arrange
      when(datasource.getTopWinningStudios())
          .thenAnswer((_) async => tListTopWinningStudiosModel);
      // act
      final result = await repository.getTopWinningStudios();

      // assert
      expect(result, equals(Right(tListTopWinningStudios)));
      verify(datasource.getTopWinningStudios());
      verifyNoMoreInteractions(datasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful',
        () async {
      //arrange
      when(datasource.getTopWinningStudios()).thenThrow(ServerException());
      // act
      final result = await repository.getTopWinningStudios();

      // assert
      verify(datasource.getTopWinningStudios());
      expect(
        result,
        equals(
          const Left(
            ServerFailure('Server Failure in get top winning studios'),
          ),
        ),
      );
    });
  });

  group('getWinnersByYear', () {
    test(
        'should return MoviesListings when the call to datasource is successful',
        () async {
      // arrange
      when(datasource.getWinnersByYear(2000))
          .thenAnswer((_) async => tListMovieModel);
      // act
      final result = await repository.getWinnersByYear(2000);

      // assert
      expect(result, equals(Right(tListMovie)));
      verify(datasource.getWinnersByYear(2000));
      verifyNoMoreInteractions(datasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful',
        () async {
      //arrange
      when(datasource.getWinnersByYear(2000)).thenThrow(ServerException());
      // act
      final result = await repository.getWinnersByYear(2000);

      // assert
      verify(datasource.getWinnersByYear(2000));
      expect(
        result,
        equals(
          const Left(
            ServerFailure('Server Failure in get winners by year'),
          ),
        ),
      );
    });
  });

  group('getMovies', () {
    test(
        'should return MoviesListings when the call to datasource is successful',
        () async {
      // arrange
      when(
        datasource.getMovies(page: 1, size: 1),
      ).thenAnswer((_) async => tMovieListingsModel);
      // act
      final result = await repository.getMovies(page: 1, size: 1);

      // assert
      expect(result, equals(Right(tMoviesListings)));
      verify(datasource.getMovies(page: 1, size: 1));
      verifyNoMoreInteractions(datasource);
    });

    test('should return a Failure when the call to datasource is unsuccessful',
        () async {
      //arrange
      when(datasource.getMovies(page: 1, size: 1)).thenThrow(ServerException());
      // act
      final result = await repository.getMovies(page: 1, size: 1);

      // assert
      verify(datasource.getMovies(page: 1, size: 1));
      expect(
        result,
        equals(const Left(ServerFailure('Server Failure in get movies'))),
      );
    });
  });
}
