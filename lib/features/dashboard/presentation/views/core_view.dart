import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/movies_listings/movies_listings_cubit.dart';
import '../cubit/multi_winner_years/multi_winner_years_cubit.dart';
import '../cubit/producers_interval_wins/producers_interval_wins_cubit.dart';
import '../cubit/search_by_year/search_by_year_cubit.dart';
import '../cubit/top_studio_awards/top_studio_awards_cubit.dart';
import 'dashboard_view.dart';
import 'list_movies_view.dart';

class CoreView extends StatefulWidget {
  const CoreView({super.key});

  @override
  State<CoreView> createState() => _CoreViewState();
}

class _CoreViewState extends State<CoreView> {
  int _currentIndex = 0;

  final List<Widget> _views = const [
    DashboardView(),
    ListMoviesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              GetIt.I<MultiWinnerYearsCubit>()..getMultiWinnerYears(),
        ),
        BlocProvider(
          create: (_) => GetIt.I<TopStudioAwardsCubit>()..getTopStudioAwards(),
        ),
        BlocProvider(
          create: (_) =>
              GetIt.I<ProducersIntervalWinsCubit>()..getProducersIntervalWins(),
        ),
        BlocProvider(create: (_) => GetIt.I<SearchByYearCubit>()),
        BlocProvider(
          create: (_) => GetIt.I<MoviesListingsCubit>()..getMovies(),
        ),
      ],
      child: Scaffold(
        body: _views[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Lista de Filmes',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
