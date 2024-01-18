import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static String name = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {
    final snackBar = SnackBar(
      content: const Text('Hola, soy un snackbar'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {},),
      duration: const Duration( seconds: 2 ),
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y diálogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies aliquam, nunc nisl aliquet nunc, quis aliquam nisl nunc sit amet nisl.')
                  ]
                );
              },
              child: const Text('Licencias usadas')
            ),
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Mostrar diálogo')
            )
          ],
        ),
      )
    );
  }
}