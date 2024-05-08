import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../models/models.dart';

abstract class RemoteDatasource {
  Future<List<MultiWinnerYearModel>> getMultiWinnerYears();
  Future<ProducersIntervalVictoriesModel> getProducersIntervalVictories();
  Future<List<WinnersByYearModel>> getWinnersByYear(int year);
  Future<List<TopWinningStudiosModel>> getTopWinningStudios();
}

class RemoteDatasourceImpl implements RemoteDatasource {
  RemoteDatasourceImpl({required this.dioClient});

  final Dio dioClient;

  @override
  Future<List<MultiWinnerYearModel>> getMultiWinnerYears() async {
    final response = await dioClient.get(Urls.multipleWinner);
    if (response.statusCode == 200) {
      final data = response.data['years'] as List;
      return data
          .map(
            (item) =>
                MultiWinnerYearModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProducersIntervalVictoriesModel>
      getProducersIntervalVictories() async {
    final response = await dioClient.get(Urls.intervalWins);
    if (response.statusCode == 200) {
      final json = response.data as Map<String, dynamic>;
      return ProducersIntervalVictoriesModel.fromJson(json);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<WinnersByYearModel>> getWinnersByYear(int year) async {
    final response = await dioClient.get('${Urls.winnerByYear}$year');
    if (response.statusCode == 200) {
      final data = response.data as List;
      return data
          .map(
            (item) => WinnersByYearModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TopWinningStudiosModel>> getTopWinningStudios() async {
    final response = await dioClient.get(Urls.studioWins);
    if (response.statusCode == 200) {
      final data = response.data['studios'] as List;
      return data
          .map(
            (item) =>
                TopWinningStudiosModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }
}
