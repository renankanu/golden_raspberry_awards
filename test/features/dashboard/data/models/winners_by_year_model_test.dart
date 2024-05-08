import 'package:flutter_test/flutter_test.dart';
import 'package:golden_raspberry_awards/features/dashboard/data/models/models.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';

import '../../../../_utils/json_reader.dart';

void main() {
  final tWinnerByYearModel = [
    const WinnersByYearModel(
      id: 1,
      year: 2024,
      title: 'The Batman',
    )
  ];

  test('should be a subclass of WinnersByYear entity', () {
    // assert
    expect(tWinnerByYearModel, isA<List<WinnersByYear>>());
  });

  test('should return winners by year model by JSON', () {
    // arrange
    final jsonMap = jsonReader('winner_by_year.json');
    final data = jsonMap as List;
    // act
    final result = data
        .map(
          (item) => WinnersByYearModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();

    // assert
    expect(result, tWinnerByYearModel);
  });
}
