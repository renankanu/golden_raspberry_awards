import 'package:flutter/material.dart';

class SearchWinnerYearContainer extends StatelessWidget {
  const SearchWinnerYearContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Listar o vencedor de filmes por ano',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Buscar por ano',
            suffixIcon: Icon(Icons.search),
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.search,
        ),
      ],
    );
  }
}
