import '../../domain/entities/entities.dart';
import 'movie_model.dart';

class MovieListingsModel extends MoviesListings {
  const MovieListingsModel({
    required super.page,
    required super.movies,
    required super.totalPages,
    required super.totalElements,
  });

  factory MovieListingsModel.fromJson(Map<String, dynamic> json) {
    return MovieListingsModel(
      page: json['page'] as int,
      movies: (json['movies'] as List)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int,
      totalElements: json['totalElements'] as int,
    );
  }
}
