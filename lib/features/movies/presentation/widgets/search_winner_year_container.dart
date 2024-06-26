import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../cubit/search_by_year/search_by_year_cubit.dart';
import 'section_title.dart';

class SearchWinnerYearContainer extends StatefulWidget {
  const SearchWinnerYearContainer({super.key, required this.onSearched});
  final VoidCallback onSearched;

  @override
  State<SearchWinnerYearContainer> createState() =>
      _SearchWinnerYearContainerState();
}

class _SearchWinnerYearContainerState extends State<SearchWinnerYearContainer> {
  final yearText = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Pesquisar por ano'),
          const SizedBox(height: 12),
          TextFormField(
            controller: yearText,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Digite o ano',
              suffixIcon: IconButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  FocusScope.of(context).unfocus();
                  context.read<SearchByYearCubit>().getWinnerByYear(
                        int.parse(yearText.text),
                      );
                  widget.onSearched();
                },
                icon: const Icon(Icons.search),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Informe o ano';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          BlocBuilder<SearchByYearCubit, SearchByYearState>(
            builder: (context, state) {
              if (state is SearchByYearLoaded) {
                widget.onSearched();
              }
              return switch (state) {
                SearchByYearLoading() => const AppIndicator(),
                SearchByYearLoaded() => state.moviesWinner.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                        child: Center(
                          child: Text('Nenhum encontrado para esse ano'),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomHeader(),
                          CustomRow(winners: state.moviesWinner),
                        ],
                      ),
                SearchByYearError() => const Center(
                    child: Text('Erro ao listar os filmes...'),
                  ),
                _ => Container()
              };
            },
          ),
        ],
      ),
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
        color: AppColors.creamCan.withOpacity(0.15),
        border: Border(
          left: BorderSide(
            color: AppColors.creamCan.withOpacity(0.5),
          ),
          top: BorderSide(
            color: AppColors.creamCan.withOpacity(0.5),
          ),
          right: BorderSide(
            color: AppColors.creamCan.withOpacity(0.5),
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

  final List<Movie> winners;

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
                    color: AppColors.creamCan.withOpacity(0.5),
                  ),
                  top: BorderSide(
                    color: AppColors.creamCan.withOpacity(0.5),
                  ),
                  right: BorderSide(
                    color: AppColors.creamCan.withOpacity(0.5),
                  ),
                  bottom: BorderSide(
                    color: isLast
                        ? AppColors.creamCan.withOpacity(0.5)
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
          },
        ),
      ],
    );
  }
}
