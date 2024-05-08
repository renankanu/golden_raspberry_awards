import 'package:flutter/material.dart';
import 'core/core.dart';
import 'features/dashboard/presentation/views/core_view.dart';

import 'injector.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden Raspberry Awards',
      theme: appTheme,
      home: const CoreView(),
    );
  }
}
