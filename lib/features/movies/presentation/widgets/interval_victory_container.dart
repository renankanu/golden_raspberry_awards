import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../domain/entities/producer.dart';
import '../cubit/producers_interval_wins/producers_interval_wins_cubit.dart';
import 'section_title.dart';

class IntervalVictoryContainer extends StatelessWidget {
  const IntervalVictoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProducersIntervalWinsCubit, ProducersIntervalWinsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Intervalo entre prêmios'),
            const SizedBox(height: 24),
            switch (state) {
              ProducersIntervalWinsLoading() => const AppIndicator(),
              ProducersIntervalWinsLoaded() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntervalWidget(
                      title: 'Menor intervalo',
                      item: state.producersIntervalWins.min[0],
                    ),
                    const SizedBox(height: 24),
                    IntervalWidget(
                      title: 'Maior intervalo',
                      item: state.producersIntervalWins.max[0],
                    ),
                  ],
                ),
              ProducersIntervalWinsError() => const Text('Erro ao carregar'),
              _ => const SizedBox.shrink(),
            },
          ],
        );
      },
    );
  }
}

class IntervalWidget extends StatelessWidget {
  const IntervalWidget({
    super.key,
    required this.title,
    required this.item,
  });

  final String title;
  final Producer item;

  String get getInterval {
    return '${item.interval} anos';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Container(
          constraints: const BoxConstraints(minWidth: 260),
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Produtor: ',
                    style: context.textTheme.displayMedium,
                    children: [
                      TextSpan(
                        text: item.producer,
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: '${item.previousWin} - ${item.followingWin}',
                    style: context.textTheme.displayMedium,
                    children: [
                      TextSpan(
                        text: ' ($getInterval)',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
