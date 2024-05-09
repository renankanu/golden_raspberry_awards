import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../models/models.dart';

abstract class MovieDatasource {
  Future<List<MultiWinnerYearModel>> getMultiWinnerYears();
  Future<ProducersIntervalVictoriesModel> getProducersIntervalVictories();
  Future<List<MovieModel>> getWinnersByYear(int year);
  Future<List<TopWinningStudiosModel>> getTopWinningStudios();
  Future<MovieListingsModel> getMovies({
    required int page,
    required int size,
    int? year,
    bool? isWinner,
  });
}

class MovieDatasourceImpl implements MovieDatasource {
  MovieDatasourceImpl({required this.dioClient});

  final Dio dioClient;

  @override
  Future<List<MultiWinnerYearModel>> getMultiWinnerYears() async {
    final response = await dioClient.get(
      Urls.baseUrl,
      queryParameters: {
        'projection': 'years-with-multiple-winners',
      },
    );
    if (response.statusCode == 200) {
      final data = response.data['years'] as List;
      return data.map((item) {
        return MultiWinnerYearModel.fromJson(item as Map<String, dynamic>);
      }).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProducersIntervalVictoriesModel>
      getProducersIntervalVictories() async {
    final response = await dioClient.get(
      Urls.baseUrl,
      queryParameters: {
        'projection': 'max-min-win-interval-for-producers',
      },
    );
    if (response.statusCode == 200) {
      final json = response.data as Map<String, dynamic>;
      return ProducersIntervalVictoriesModel.fromJson(json);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getWinnersByYear(int year) async {
    final response = await dioClient.get(
      Urls.baseUrl,
      queryParameters: {
        'winner': 'true',
        'year': year,
      },
    );
    if (response.statusCode == 200) {
      final data = response.data as List;
      return data
          .map(
            (item) => MovieModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TopWinningStudiosModel>> getTopWinningStudios() async {
    final response = await dioClient.get(
      Urls.baseUrl,
      queryParameters: {
        'projection': 'studios-with-win-count',
      },
    );
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

  @override
  Future<MovieListingsModel> getMovies({
    required int page,
    required int size,
    int? year,
    bool? isWinner,
  }) async {
    final response = await dioClient.get(
      Urls.baseUrl,
      queryParameters: {
        'page': page,
        'size': size,
        if (year != null) 'year': year,
        if (isWinner != null) 'winner': isWinner,
      },
    );
    if (response.statusCode == 200) {
      final json = response.data as Map<String, dynamic>;
      return MovieListingsModel.fromJson(json);
    } else {
      throw ServerException();
    }
  }
}
