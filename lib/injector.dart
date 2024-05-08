import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/dashboard/data/datasource/remote_datasource.dart';
import 'features/dashboard/data/repositories/movie_repository_impl.dart';
import 'features/dashboard/domain/repositories/movie_repository.dart';
import 'features/dashboard/domain/usecases/movie_usecases.dart';
import 'features/dashboard/domain/usecases/multi_winner_years_usecases.dart';
import 'features/dashboard/domain/usecases/producers_interval_victories_usecases.dart';
import 'features/dashboard/domain/usecases/top_winning_studios_usecases.dart';
import 'features/dashboard/domain/usecases/winner_by_year_usecases.dart';
import 'features/dashboard/presentation/cubit/movies_listings/movies_listings_cubit.dart';
import 'features/dashboard/presentation/cubit/multi_winner_years/multi_winner_years_cubit.dart';
import 'features/dashboard/presentation/cubit/producers_interval_wins/producers_interval_wins_cubit.dart';
import 'features/dashboard/presentation/cubit/search_by_year/search_by_year_cubit.dart';
import 'features/dashboard/presentation/cubit/top_studio_awards/top_studio_awards_cubit.dart';

final injector = GetIt.instance;

void init() {
  injector
    ..registerSingleton<Dio>(Dio())

    //usecases
    ..registerLazySingleton(
      () => MultiWinnerYearsUseCase(injector()),
    )
    ..registerLazySingleton(
      () => ProducersIntervalVictoriesUseCase(injector()),
    )
    ..registerLazySingleton(
      () => TopWinningStudiosUseCase(injector()),
    )
    ..registerLazySingleton(
      () => WinnerByYearUseCase(injector()),
    )
    ..registerLazySingleton(
      () => MovieUsecases(injector()),
    )

    //repositories
    ..registerLazySingleton<MovieRepository>(
      () => DashboardRepositoryImpl(remoteDatasource: injector()),
    )

    //datasources
    ..registerLazySingleton<RemoteDatasource>(
      () => RemoteDatasourceImpl(dioClient: injector()),
    )

    //cubits
    ..registerLazySingleton<MultiWinnerYearsCubit>(
      () => MultiWinnerYearsCubit(injector()),
    )
    ..registerLazySingleton<TopStudioAwardsCubit>(
      () => TopStudioAwardsCubit(injector()),
    )
    ..registerLazySingleton<ProducersIntervalWinsCubit>(
      () => ProducersIntervalWinsCubit(injector()),
    )
    ..registerLazySingleton<SearchByYearCubit>(
      () => SearchByYearCubit(injector()),
    )
    ..registerLazySingleton<MoviesListingsCubit>(
      () => MoviesListingsCubit(injector()),
    );
}
