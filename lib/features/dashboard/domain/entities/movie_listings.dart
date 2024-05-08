import 'package:equatable/equatable.dart';

import 'movie.dart';

class MoviesListings extends Equatable {
  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalElements;

  const MoviesListings({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalElements,
  });

  @override
  List<Object> get props => [
        page,
        movies,
        totalPages,
        totalElements,
      ];
}
