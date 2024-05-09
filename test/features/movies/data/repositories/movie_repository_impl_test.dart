import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/features/movies/data/datasource/movie_datasource.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/models.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/producer_model.dart';
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

    tListMultiWinnerYear = [
      const MultiWinnerYear(year: 2000, wins: 1),
      const MultiWinnerYear(year: 2001, wins: 2),
    ];
    tProducersIntervalVictories = const ProducersIntervalWins(
      min: [
        Producer(
          producer: 'John Doe',
          interval: 1,
          previousWin: 2000,
          followingWin: 2001,
        ),
      ],
      max: [
        Producer(
          producer: 'Jane Doe',
          interval: 2,
          previousWin: 2000,
          followingWin: 2002,
        ),
      ],
    );
    tListMovie = [
      const Movie(
        id: 1,
        year: 2000,
        title: 'Batman',
        isWinner: true,
      ),
    ];
    tListTopWinningStudios = [
      const TopWinningStudios(studio: 'John Doe', wins: 1),
      const TopWinningStudios(studio: 'Jane Doe', wins: 2),
    ];
    tMoviesListings = MoviesListings(
      movies: tListMovie,
      page: 1,
      totalPages: 1,
      totalElements: 1,
    );
  });

  group('getProducersIntervalVictories', () {
    test(
        'should return ProducersIntervalWins when the call to datasource is successful',
        () async {
      when(datasource.getProducersIntervalVictories())
          .thenAnswer((_) async => tProducersIntervalVictoriesModel);

      final result = await repository.getProducersIntervalVictories();

      expect(result, equals(Right(tProducersIntervalVictories)));
      verify(datasource.getProducersIntervalVictories());
      verifyNoMoreInteractions(datasource);
    });
  });
}
