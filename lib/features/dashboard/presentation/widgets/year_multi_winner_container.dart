import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/multi_winner_years/multi_winner_years_cubit.dart';

class YearMultiWinnerContainer extends StatelessWidget {
  const YearMultiWinnerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiWinnerYearsCubit, MultiWinnerYearsState>(
        builder: (context, state) {
      return Column(
        children: [
          const Text(
            'Ano com mais premiações',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          switch (state) {
            MultiWinnerYearsLoading() => const CircularProgressIndicator(),
            MultiWinnerYearsLoaded() => Row(
                children: state.multiWinnersYears.map((e) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(e.year.toString()),
                          Text('${e.wins} filmes'),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            MultiWinnerYearsError() => const Text('Erro ao carregar'),
            _ => const SizedBox.shrink(),
          }
        ],
      );
    });
  }
}