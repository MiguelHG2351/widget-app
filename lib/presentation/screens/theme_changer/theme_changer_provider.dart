import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChargerScreen extends ConsumerWidget {
  static const String name = 'Theme changer';
  
  const ThemeChargerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch( themeNotifierProvider ).isDarkmode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            }, 
            icon: Icon(isDarkmode ? Icons.dark_mode_outlined: Icons.light_mode_outlined)
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch( colorListProvider );
    // final selectedColor = ref.watch( selectedColorProvider );
    final selectedColor = ref.watch( themeNotifierProvider ).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged:(value) {
            ref.read( themeNotifierProvider.notifier ).changeColorIndex(index);
          },
        );
      },
    );
  }
}