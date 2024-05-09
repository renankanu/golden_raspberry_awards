import 'package:flutter_test/flutter_test.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/models.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';

import '../../../../_utils/json_reader.dart';

void main() {
  final tWinnerByYearModel = [
    const MovieModel(
      id: 1,
      year: 2024,
      title: 'The Batman',
      isWinner: true,
    ),
  ];

  test('should be a subclass of Movie entity', () {
    // assert
    expect(tWinnerByYearModel.first.toEntity(), isA<Movie>());
  });

  test('should return winners by year model by JSON', () {
    // arrange
    final jsonMap = jsonReader('winner_by_year.json');
    final data = jsonMap as List;
    // act
    final result = data
        .map(
          (item) => MovieModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();

    // assert
    expect(result, tWinnerByYearModel);
  });
}
