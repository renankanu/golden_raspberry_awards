import 'package:flutter_test/flutter_test.dart';
import 'package:golden_raspberry_awards/features/dashboard/data/models/models.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';

import '../../../../_utils/json_reader.dart';

void main() {
  const tMultiWinnerYearModel = [
    MultiWinnerYearModel(
      year: 1999,
      wins: 1,
    ),
    MultiWinnerYearModel(
      year: 2010,
      wins: 3,
    ),
    MultiWinnerYearModel(
      year: 2015,
      wins: 2,
    ),
  ];

  test('should be a subclass of MultiWinnerYear entity', () {
    // assert
    expect(tMultiWinnerYearModel, isA<List<MultiWinnerYear>>());
  });

  test('should return multi winner model by JSON', () {
    // arrange
    final jsonMap = jsonReader('years-with-multiple-winners.json');
    final data = jsonMap['years'] as List;
    // act
    final result = data
        .map(
          (item) => MultiWinnerYearModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();

    // assert
    expect(result, tMultiWinnerYearModel);
  });
}
