import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signals/signals_flutter.dart';

import 'cubit/main_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'Signals and Cubit'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final signalsCounter = signal(0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Cubit', style: TextStyle(fontSize: 24)),
                  const Text(
                    'You have pushed the button this many times:'
                  ),
                  Text(
                    '${(state as MainLoadedState).counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ElevatedButton(
                    onPressed: BlocProvider.of<MainCubit>(context).count,
                    child: const Icon(Icons.add),
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 48),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Signals', style: TextStyle(fontSize: 24)),
                const Text('You have pushed the button this many times:'),
                Watch(
                  (context) => Text(
                    '${signalsCounter.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                ElevatedButton(
                  onPressed: () =>
                      signalsCounter.value++,
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
