import 'package:flutter/material.dart';
import 'package:golden_raspberry_awards/features/dashboard/presentation/widgets/search_winner_year_container.dart';
import 'package:golden_raspberry_awards/features/dashboard/presentation/widgets/year_multi_winner_container.dart';

import '../widgets/interval_victory_container.dart';
import '../widgets/top_studios_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
