import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';
import 'movie_model.dart';

class MovieListingsModel extends Equatable {
  const MovieListingsModel({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalElements,
  });

  final int page;
  final List<MovieModel> movies;
  final int totalPages;
  final int totalElements;

  factory MovieListingsModel.fromJson(Map<String, dynamic> json) {
    return MovieListingsModel(
      page: json['number'] as int,
      movies: (json['content'] as List)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int,
      totalElements: json['totalElements'] as int,
    );
  }

  MoviesListings toEntity() {
    return MoviesListings(
      page: page,
      movies: movies.map((e) => e.toEntity()).toList(),
      totalPages: totalPages,
      totalElements: totalElements,
    );
  }

  @override
  List<Object?> get props => [
        page,
        movies,
        totalPages,
        totalElements,
      ];
}
