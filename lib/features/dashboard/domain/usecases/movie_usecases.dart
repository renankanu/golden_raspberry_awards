import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/movie_repository.dart';

class MovieUsecases {
  final MovieRepository movieRepository;

  MovieUsecases(this.movieRepository);

  Future<Either<Failure, MoviesListings>> call({required int page}) async {
    return movieRepository.getMovies(page: page);
  }
}
