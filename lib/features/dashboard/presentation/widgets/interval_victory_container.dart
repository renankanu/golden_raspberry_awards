import 'package:flutter/material.dart';
import 'package:golden_raspberry_awards/core/constants/app_colors.dart';

class IntervalVictoryContainer extends StatelessWidget {
  const IntervalVictoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Intervalo de premiações',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        IntervalWidget(),
        SizedBox(height: 24),
        IntervalWidget(),
      ],
    );
  }
}

class IntervalWidget extends StatelessWidget {
  const IntervalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Maior intervalo', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 12),
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
                const Text('Matthew Vaughn'),
                RichText(
                    text: const TextSpan(
                  text: '1990 - 1999',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mineShaft),
                  children: [
                    TextSpan(
                      text: ' (10 anos)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
