import 'package:dio/dio.dart';
import 'package:golden_raspberry_awards/features/movies/data/datasource/movie_datasource.dart';
import 'package:golden_raspberry_awards/features/movies/domain/repositories/movie_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  Dio,
  MovieRepository,
  MovieDatasource,
])
void main() {}
