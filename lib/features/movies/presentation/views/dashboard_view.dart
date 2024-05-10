import 'package:flutter/material.dart';

import '../widgets/interval_victory_container.dart';
import '../widgets/search_winner_year_container.dart';
import '../widgets/top_studios_container.dart';
import '../widgets/year_multi_winner_container.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final scrollController = ScrollController();

  Future<void> _scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 200));
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YearMultiWinnerContainer(),
            const Separator(),
            const TopStudiosContainer(),
            const Separator(),
            const IntervalVictoryContainer(),
            const Separator(),
            SearchWinnerYearContainer(
              onSearched: _scrollToBottom,
            ),
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
