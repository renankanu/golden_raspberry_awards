import 'package:flutter/material.dart';

class TopStudiosContainer extends StatelessWidget {
  const TopStudiosContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Top 3 Estúdios com mais premiações',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    Text('Paramount Pictures'),
                    Text('10 prêmios'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    Text('Warner Bros'),
                    Text('8 prêmios'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
