import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
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
              ProducersIntervalWinsLoading() =>
                const CircularProgressIndicator(),
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
        DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mineShaft,
                    ),
                    children: [
                      TextSpan(
                        text: item.producer,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: '${item.previousWin} - ${item.followingWin}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mineShaft,
                    ),
                    children: [
                      TextSpan(
                        text: ' ($getInterval)',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
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
