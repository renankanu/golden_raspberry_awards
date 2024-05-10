import 'package:dio/dio.dart';
import 'package:golden_raspberry_awards/features/movies/data/datasource/movie_datasource.dart';
import 'package:golden_raspberry_awards/features/movies/domain/repositories/movie_repository.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/movie_usecases.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/multi_winner_years_usecases.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/producers_interval_victories_usecases.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/top_winning_studios_usecases.dart';
import 'package:golden_raspberry_awards/features/movies/domain/usecases/winner_by_year_usecases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  Dio,
  MovieRepository,
  MovieDatasource,
  MovieUsecase,
  MultiWinnerYearsUseCase,
  ProducersIntervalVictoriesUseCase,
  TopWinningStudiosUseCase,
  WinnerByYearUseCase,
])
void main() {}
