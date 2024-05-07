import 'package:dio/dio.dart';
import 'package:golden_raspberry_awards/features/dashboard/data/models/models.dart';

import '../../../../core/core.dart';

abstract class RemoteDatasource {
  Future<List<MultiWinnerYearModel>> getMultiWinnerYears();
  Future<List<ProducersIntervalVictoriesModel>> getProducersIntervalVictories();
  Future<List<WinnersByYearModel>> getWinnersByYear();
  Future<List<TopWinningStudiosModel>> getTopWinningStudios();
}

class RemoteDatasourceImpl implements RemoteDatasource {
  RemoteDatasourceImpl({required this.dioClient});

  final Dio dioClient;

  @override
  Future<List<MultiWinnerYearModel>> getMultiWinnerYears() async {
    final response = await dioClient.get('/multi_winner_years');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((e) => MultiWinnerYearModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProducersIntervalVictoriesModel>>
      getProducersIntervalVictories() {
    throw UnimplementedError();
  }

  @override
  Future<List<WinnersByYearModel>> getWinnersByYear() {
    throw UnimplementedError();
  }

  @override
  Future<List<TopWinningStudiosModel>> getTopWinningStudios() {
    throw UnimplementedError();
  }
}
