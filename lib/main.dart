import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'features/movies/presentation/cubit/movies_listings/movies_listings_cubit.dart';
import 'features/movies/presentation/views/core_view.dart';
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
        BlocProvider<MoviesListingsCubit>(
          create: (context) => di.injector<MoviesListingsCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Golden Raspberry Awards',
        theme: appTheme,
        home: const CoreView(),
      ),
    );
  }
}
