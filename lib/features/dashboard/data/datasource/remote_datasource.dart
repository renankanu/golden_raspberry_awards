import 'package:dio/dio.dart';
import 'package:golden_raspberry_awards/features/dashboard/data/models/models.dart';

import '../../../../core/core.dart';

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
      final List<dynamic> data = response.data['years'];
      return data.map((item) => MultiWinnerYearModel.fromJson(item)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProducersIntervalVictoriesModel>
      getProducersIntervalVictories() async {
    final response = await dioClient.get(Urls.intervalWins);
    if (response.statusCode == 200) {
      return ProducersIntervalVictoriesModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<WinnersByYearModel>> getWinnersByYear(int year) async {
    final response = await dioClient.get('${Urls.winnerByYear}$year');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => WinnersByYearModel.fromJson(item)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TopWinningStudiosModel>> getTopWinningStudios() async {
    final response = await dioClient.get(Urls.studioWins);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['studios'];
      return data.map((item) => TopWinningStudiosModel.fromJson(item)).toList();
    } else {
      throw ServerException();
    }
  }
}
