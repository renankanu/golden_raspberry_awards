import 'package:flutter_test/flutter_test.dart';
import 'package:golden_raspberry_awards/features/dashboard/data/models/models.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';

import '../../../../_utils/json_reader.dart';

void main() {
  const tTopWinningStudiosModel = [
    TopWinningStudiosModel(
      studio: 'Bollywood One',
      wins: 1,
    ),
    TopWinningStudiosModel(
      studio: 'Bollywood Two',
      wins: 2,
    ),
    TopWinningStudiosModel(
      studio: 'Bollywood Three',
      wins: 3,
    ),
  ];

  test('should be a subclass of TopWinningStudios entity', () {
    // assert
    expect(tTopWinningStudiosModel, isA<List<TopWinningStudios>>());
  });

  test('should return top winning studios model by JSON', () {
    // arrange
    final jsonMap = jsonReader('studios-with-win-count.json');
    final data = jsonMap['studios'] as List;
    // act
    final result = data
        .map(
          (item) =>
              TopWinningStudiosModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();

    // assert
    expect(result, tTopWinningStudiosModel);
  });
}
