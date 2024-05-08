// Mocks generated by Mockito 5.4.4 from annotations
// in golden_raspberry_awards/test/features/dashboard/domain/usecases/winner_by_year_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:fpdart/fpdart.dart' as _i4;
import 'package:golden_raspberry_awards/core/errors/failure.dart' as _i5;
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart'
    as _i6;
import 'package:golden_raspberry_awards/features/dashboard/domain/repositories/movie_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i2.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<
      _i4.Either<_i5.Failure,
          List<_i6.MultiWinnerYear>>> getMultiWinnerYears() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMultiWinnerYears,
          [],
        ),
        returnValue: _i3
            .Future<_i4.Either<_i5.Failure, List<_i6.MultiWinnerYear>>>.value(
            _i7.dummyValue<_i4.Either<_i5.Failure, List<_i6.MultiWinnerYear>>>(
          this,
          Invocation.method(
            #getMultiWinnerYears,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, List<_i6.MultiWinnerYear>>>);

  @override
  _i3.Future<
      _i4.Either<_i5.Failure,
          _i6.ProducersIntervalWins>> getProducersIntervalVictories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducersIntervalVictories,
          [],
        ),
        returnValue: _i3
            .Future<_i4.Either<_i5.Failure, _i6.ProducersIntervalWins>>.value(
            _i7.dummyValue<_i4.Either<_i5.Failure, _i6.ProducersIntervalWins>>(
          this,
          Invocation.method(
            #getProducersIntervalVictories,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, _i6.ProducersIntervalWins>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, List<_i6.Movie>>> getWinnersByYear(
          int? year) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWinnersByYear,
          [year],
        ),
        returnValue: _i3.Future<_i4.Either<_i5.Failure, List<_i6.Movie>>>.value(
            _i7.dummyValue<_i4.Either<_i5.Failure, List<_i6.Movie>>>(
          this,
          Invocation.method(
            #getWinnersByYear,
            [year],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, List<_i6.Movie>>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, List<_i6.TopWinningStudios>>>
      getTopWinningStudios() => (super.noSuchMethod(
            Invocation.method(
              #getTopWinningStudios,
              [],
            ),
            returnValue: _i3.Future<
                    _i4.Either<_i5.Failure, List<_i6.TopWinningStudios>>>.value(
                _i7.dummyValue<
                    _i4.Either<_i5.Failure, List<_i6.TopWinningStudios>>>(
              this,
              Invocation.method(
                #getTopWinningStudios,
                [],
              ),
            )),
          ) as _i3
              .Future<_i4.Either<_i5.Failure, List<_i6.TopWinningStudios>>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, _i6.MoviesListings>> getMovies(
          {required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovies,
          [],
          {#page: page},
        ),
        returnValue:
            _i3.Future<_i4.Either<_i5.Failure, _i6.MoviesListings>>.value(
                _i7.dummyValue<_i4.Either<_i5.Failure, _i6.MoviesListings>>(
          this,
          Invocation.method(
            #getMovies,
            [],
            {#page: page},
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, _i6.MoviesListings>>);
}