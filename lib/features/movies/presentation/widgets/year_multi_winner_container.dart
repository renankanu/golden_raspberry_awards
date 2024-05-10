import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/extensions/context_extension.dart';
import '../cubit/multi_winner_years/multi_winner_years_cubit.dart';
import 'section_title.dart';

class YearMultiWinnerContainer extends StatelessWidget {
  const YearMultiWinnerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiWinnerYearsCubit, MultiWinnerYearsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Anos com mais premiações'),
            const SizedBox(height: 12),
            switch (state) {
              MultiWinnerYearsLoading() => const AppIndicator(),
              MultiWinnerYearsLoaded() => Row(
                  children: state.multiWinnersYears.map((winner) {
                    return Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              winner.year.toString(),
                              style: context.textTheme.titleMedium,
                            ),
                            Text('${winner.wins} filmes'),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              MultiWinnerYearsError() => const Text('Erro ao carregar'),
              _ => const SizedBox.shrink(),
            },
          ],
        );
      },
    );
  }
}
