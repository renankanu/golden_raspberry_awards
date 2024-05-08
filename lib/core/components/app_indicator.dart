import 'package:flutter/material.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 2.5,
      ),
    );
  }
}
