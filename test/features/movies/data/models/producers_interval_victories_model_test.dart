import 'package:flutter_test/flutter_test.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/models.dart';
import 'package:golden_raspberry_awards/features/movies/data/models/producer_model.dart';
import 'package:golden_raspberry_awards/features/movies/domain/entities/entities.dart';

import '../../../../_utils/json_reader.dart';

void main() {
  const tProducersIntervalVictoriesModel = ProducersIntervalVictoriesModel(
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

  test('should be a subclass of ProducersIntervalWins entity', () {
    // assert
    expect(
      tProducersIntervalVictoriesModel.toEntity(),
      isA<ProducersIntervalWins>(),
    );
  });

  test('should return producers interval victories model by JSON', () {
    // arrange
    final jsonMap = jsonReader('max-min-win-interval-for-producers.json');
    // act
    final result = ProducersIntervalVictoriesModel.fromJson(
      jsonMap as Map<String, dynamic>,
    );
    // assert
    expect(result, tProducersIntervalVictoriesModel);
  });
}
