import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_raspberry_awards/features/dashboard/presentation/cubit/search_by_year/search_by_year_cubit.dart';
import 'package:golden_raspberry_awards/features/dashboard/presentation/widgets/search_winner_year_container.dart';
import 'package:golden_raspberry_awards/features/dashboard/presentation/widgets/year_multi_winner_container.dart';

import '../cubit/multi_winner_years/multi_winner_years_cubit.dart';
import '../cubit/producers_interval_wins/producers_interval_wins_cubit.dart';
import '../cubit/top_studio_awards/top_studio_awards_cubit.dart';
import '../widgets/interval_victory_container.dart';
import '../widgets/top_studios_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                GetIt.I<MultiWinnerYearsCubit>()..getMultiWinnerYears(),),
        BlocProvider(
            create: (_) =>
                GetIt.I<TopStudioAwardsCubit>()..getTopStudioAwards(),),
        BlocProvider(
            create: (_) => GetIt.I<ProducersIntervalWinsCubit>()
              ..getProducersIntervalWins(),),
        BlocProvider(create: (_) => GetIt.I<SearchByYearCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YearMultiWinnerContainer(),
              Separator(),
              TopStudiosContainer(),
              Separator(),
              IntervalVictoryContainer(),
              Separator(),
              SearchWinnerYearContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 12),
        Divider(),
        SizedBox(height: 12),
      ],
    );
  }
}
