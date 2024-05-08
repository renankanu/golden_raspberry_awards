import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/dashboard/presentation/cubit/search_by_year/search_by_year_cubit.dart';
import 'package:golden_raspberry_awards/features/dashboard/presentation/widgets/section_title.dart';

import '../../domain/entities/entities.dart';

class SearchWinnerYearContainer extends StatelessWidget {
  const SearchWinnerYearContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Pesquisar por ano'),
        const SizedBox(height: 12),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Digite o ano',
            suffixIcon: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.read<SearchByYearCubit>().getWinnerByYear(1990);
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const CustomHeader(),
        BlocBuilder<SearchByYearCubit, SearchByYearState>(
          builder: ((context, state) {
            return switch (state) {
              SearchByYearLoading() => const CircularProgressIndicator(),
              SearchByYearLoaded() => CustomRow(winners: state.moviesWinner),
              SearchByYearError() => const Text('Erro ao listar os filmes...'),
              _ => Container()
            };
          }),
        )
      ],
    );
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.mineShaft.withOpacity(0.15),
        border: Border(
          left: BorderSide(
            color: AppColors.mineShaft.withOpacity(0.5),
          ),
          top: BorderSide(
            color: AppColors.mineShaft.withOpacity(0.5),
          ),
          right: BorderSide(
            color: AppColors.mineShaft.withOpacity(0.5),
          ),
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Text('Id'),
          ),
          Expanded(
            child: Text('Year'),
          ),
          Expanded(
            child: Text('Title'),
          ),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.winners,
  });

  final List<WinnersByYear> winners;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: winners.length,
            itemBuilder: (context, index) {
              final winner = winners[index];
              final isLast = winners.length == index + 1;
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: AppColors.mineShaft.withOpacity(0.5),
                    ),
                    top: BorderSide(
                      color: AppColors.mineShaft.withOpacity(0.5),
                    ),
                    right: BorderSide(
                      color: AppColors.mineShaft.withOpacity(0.5),
                    ),
                    bottom: BorderSide(
                      color: isLast
                          ? AppColors.mineShaft.withOpacity(0.5)
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('${winner.id}'),
                    ),
                    Expanded(
                      child: Text('${winner.year}'),
                    ),
                    Expanded(
                      child: Text(winner.title),
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }
}
