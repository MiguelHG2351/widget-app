import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});
  static String name = 'Counter Screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).textTheme;
    final int clickCounter = ref.watch( counterProvider );
    final bool isDarkMode = ref.watch( isDarkModeProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
          },
          icon: Icon(isDarkMode ? Icons.dark_mode_outlined: Icons.light_mode_outlined))
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter', style: colors.headlineLarge,)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read( counterProvider.notifier ).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}