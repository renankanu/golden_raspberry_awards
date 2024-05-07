import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/dashboard/presentation/views/core_view.dart';

import 'features/dashboard/presentation/cubit/get_multi_winner_years/get_multi_winner_years_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.injector<GetMultiWinnerYearsCubit>(),
        )
      ],
      child: MaterialApp(
        title: 'Golden Raspberry Awards',
        theme: appTheme,
        home: const CoreView(),
      ),
    );
  }
}
