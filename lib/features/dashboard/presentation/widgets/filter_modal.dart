import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../cubit/movies_listings/movies_listings_cubit.dart';

void showFilterModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      final yearController = TextEditingController();
      final selectedYear = context.read<MoviesListingsCubit>().year;
      final isWinner = context.read<MoviesListingsCubit>().isWinner;
      int selectedIndex = isWinner == null ? 0 : (isWinner ? 1 : 2);

      if (selectedYear != null) {
        yearController.text = selectedYear.toString();
      }
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Filtrar por:'),
                  const SizedBox(height: 8),
                  Text('Ano', style: Theme.of(context).textTheme.titleMedium),
                  TextField(
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Digite o ano',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Vencedores?',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(8),
                    textStyle: const TextStyle(fontSize: 12),
                    fillColor: AppColors.creamCan,
                    selectedColor: AppColors.mineShaft,
                    constraints:
                        const BoxConstraints(minWidth: 82, minHeight: 42),
                    isSelected: [
                      selectedIndex == 0,
                      selectedIndex == 1,
                      selectedIndex == 2,
                    ],
                    onPressed: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    children: const [
                      LabelToggle(label: 'Todos'),
                      LabelToggle(label: 'Sim'),
                      LabelToggle(label: 'Não'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          yearController.clear();
                          setState(() {
                            selectedIndex = 0;
                          });
                          context.read<MoviesListingsCubit>().filterMovies();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Limpar',
                          style: TextStyle(color: AppColors.mineShaft),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          context.read<MoviesListingsCubit>().filterMovies(
                                year: yearController.text.isNotEmpty
                                    ? int.parse(yearController.text)
                                    : null,
                                isWinner: selectedIndex == 1
                                    ? true
                                    : (selectedIndex == 2 ? false : null),
                              );
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Filtrar',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class LabelToggle extends StatelessWidget {
  const LabelToggle({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(label),
    );
  }
}
