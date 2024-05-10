import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../domain/entities/entities.dart';
import '../cubit/top_studio_awards/top_studio_awards_cubit.dart';
import 'section_title.dart';

class TopStudiosContainer extends StatelessWidget {
  const TopStudiosContainer({super.key});

  List<TopWinningStudios> _getTopStudios(List<TopWinningStudios> studios) {
    studios.sort((previous, next) => next.wins.compareTo(previous.wins));
    return studios.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopStudioAwardsCubit, TopStudioAwardsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Estúdios com mais prêmios'),
            const SizedBox(height: 12),
            switch (state) {
              TopStudioAwardsLoading() => const AppIndicator(),
              TopStudioAwardsLoaded() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _getTopStudios(state.topStudioAwards).map((item) {
                    return Container(
                      constraints: const BoxConstraints(minWidth: 200),
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.studio,
                            style: context.textTheme.titleMedium,
                          ),
                          Text('${item.wins} filmes'),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              TopStudioAwardsError() => const Text('Erro ao carregar'),
              _ => const SizedBox.shrink(),
            },
          ],
        );
      },
    );
  }
}
