import 'package:flutter_test/flutter_test.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/movie_listings_model.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/movie_model.dart';

import '../../../../_utils/json_reader.dart';

void main() {
  const tMovieModel = MovieListingsModel(
    page: 1,
    movies: [
      MovieModel(
        id: 1,
        year: 2000,
        title: 'Batman',
        isWinner: true,
      ),
    ],
    totalPages: 1,
    totalElements: 1,
  );

  test('should be a subclass of Movie entity', () {
    // assert
    expect(tMovieModel, isA<MovieListingsModel>());
  });

  test('should return movie model by JSON', () {
    // arrange
    final jsonMap = jsonReader('movies.json');
    // act
    final result = MovieListingsModel.fromJson(jsonMap as Map<String, dynamic>);
    // assert
    expect(result, tMovieModel);
  });
}
