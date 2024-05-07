import 'package:flutter/material.dart';

class SearchWinnerYearContainer extends StatelessWidget {
  const SearchWinnerYearContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Listar o vencedor de filmes por ano',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
