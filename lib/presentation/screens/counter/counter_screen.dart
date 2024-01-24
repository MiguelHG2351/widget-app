import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  static String name = 'Counter Screen';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).textTheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
      ),
      body: Center(
        child: Text('Valor: 10', style: colors.headlineLarge,)
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}