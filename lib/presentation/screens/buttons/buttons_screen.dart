import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static String name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons screens'),
      ),
      body: const Placeholder()
    );
  }
}