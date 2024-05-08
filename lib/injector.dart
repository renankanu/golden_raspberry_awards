import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/dashboard/data/datasource/remote_datasource.dart';
import 'features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'features/dashboard/domain/repositories/dashboard_repository.dart';
import 'features/dashboard/domain/usecases/get_multi_winner_years.dart';
import 'features/dashboard/domain/usecases/get_producers_interval_victories.dart';
import 'features/dashboard/domain/usecases/get_top_winning_studios.dart';
import 'features/dashboard/domain/usecases/get_winner_by_year.dart';
import 'features/dashboard/presentation/cubit/multi_winner_years/multi_winner_years_cubit.dart';
import 'features/dashboard/presentation/cubit/producers_interval_wins/producers_interval_wins_cubit.dart';
import 'features/dashboard/presentation/cubit/search_by_year/search_by_year_cubit.dart';
import 'features/dashboard/presentation/cubit/top_studio_awards/top_studio_awards_cubit.dart';

final injector = GetIt.instance;

void init() {
  injector
    ..registerSingleton<Dio>(Dio())

    //usecases
    ..registerLazySingleton(() => GetMultiWinnerYearsUseCase(injector()))
    ..registerLazySingleton(
      () => GetProducersIntervalVictoriesUseCase(injector()),
    )
    ..registerLazySingleton(() => GetTopWinningStudiosUseCase(injector()))
    ..registerLazySingleton(() => GetWinnerByYearUseCase(injector()))

    //repositories
    ..registerLazySingleton<DashboardRepository>(
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
    );
}
