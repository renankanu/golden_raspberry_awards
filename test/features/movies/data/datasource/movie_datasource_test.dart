import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/movies/data/datasource/movie_datasource.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/models.dart';
import 'package:mockito/mockito.dart';

import '../../../../_utils/json_reader.dart';
import '../../../../_utils/mock/mocks.mocks.dart';

void main() {
  late MovieDatasourceImpl datasource;
  late MockDio mock;

  setUp(() {
    mock = MockDio();
    datasource = MovieDatasourceImpl(dioClient: mock);
  });

  void setUpMockDioSuccess200(dynamic jsonMap) {
    when(mock.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer(
      (_) async => Response(
        data: jsonMap,
        statusCode: 200,
        requestOptions: RequestOptions(),
      ),
    );
  }

  void setUpMockDioError404() {
    when(mock.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer(
      (_) async => Response(
        statusCode: 500,
        requestOptions: RequestOptions(),
      ),
    );
  }

  group('getMultiWinnerYears', () {
    test('should return a list of MultiWinnerYearModel', () async {
      // arrange
      final jsonMap = jsonReader('years-with-multiple-winners.json');
      final data = jsonMap['years'] as List;
      final tMultiWinnerYearModel = data
          .map(
            (item) =>
                MultiWinnerYearModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();

      setUpMockDioSuccess200(jsonMap);
      //act
      final result = await datasource.getMultiWinnerYears();

      //assert
      expect(result, isA<List<MultiWinnerYearModel>>());
      expect(result, equals(tMultiWinnerYearModel));
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // arrange
      setUpMockDioError404();

      //act
      final call = datasource.getMultiWinnerYears;

      //assert
      expect(() => call(), throwsA(isA<ServerException>()));
    });
  });
  group('getProducersIntervalVictories', () {
    test('should return a list of ProducerIntervalModel', () async {
      // arrange
      final jsonMap = jsonReader('max-min-win-interval-for-producers.json');
      final tProducersIntervalVictoriesModel =
          ProducersIntervalVictoriesModel.fromJson(
        jsonMap as Map<String, dynamic>,
      );

      setUpMockDioSuccess200(jsonMap);
      //act
      final result = await datasource.getProducersIntervalVictories();

      //assert
      expect(result, isA<ProducersIntervalVictoriesModel>());
      expect(result, equals(tProducersIntervalVictoriesModel));
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // arrange
      setUpMockDioError404();

      //act
      final call = datasource.getProducersIntervalVictories;

      //assert
      expect(() => call(), throwsA(isA<ServerException>()));
    });
  });
  group('getWinnersByYear', () {
    test('should return a list of MovieModel', () async {
      // arrange
      final jsonMap = jsonReader('winner_by_year.json');
      final data = jsonMap as List;
      final tWinnerByYearModel = data
          .map(
            (item) => MovieModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();

      setUpMockDioSuccess200(jsonMap);
      //act
      final result = await datasource.getWinnersByYear(1);

      //assert
      expect(result, isA<List<MovieModel>>());
      expect(result, equals(tWinnerByYearModel));
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // arrange
      setUpMockDioError404();

      //act
      final call = datasource.getWinnersByYear;

      //assert
      expect(() => call(1), throwsA(isA<ServerException>()));
    });
  });
  group('getTopWinningStudios', () {
    test('should return a list of StudioModel', () async {
      // arrange
      final jsonMap = jsonReader('studios-with-win-count.json');
      final data = jsonMap['studios'] as List;
      final tTopWinningStudiosModel = data
          .map(
            (item) =>
                TopWinningStudiosModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();

      setUpMockDioSuccess200(jsonMap);
      //act
      final result = await datasource.getTopWinningStudios();

      //assert
      expect(result, isA<List<TopWinningStudiosModel>>());
      expect(result, equals(tTopWinningStudiosModel));
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // arrange
      setUpMockDioError404();

      //act
      final call = datasource.getTopWinningStudios;

      //assert
      expect(() => call(), throwsA(isA<ServerException>()));
    });
  });
  group('getMovies', () {
    test('should return a list of MovieModel', () async {
      // arrange
      final jsonMap = jsonReader('movies.json');
      final tMovieModel =
          MovieListingsModel.fromJson(jsonMap as Map<String, dynamic>);

      setUpMockDioSuccess200(jsonMap);
      //act
      final result = await datasource.getMovies(
        page: 1,
        size: 1,
        year: 2021,
        isWinner: true,
      );

      //assert
      expect(result, isA<MovieListingsModel>());
      expect(result, equals(tMovieModel));
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // arrange
      setUpMockDioError404();

      //act
      final call = datasource.getMovies;

      //assert
      expect(
        () => call(
          page: 1,
          size: 1,
          year: 2021,
          isWinner: true,
        ),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
