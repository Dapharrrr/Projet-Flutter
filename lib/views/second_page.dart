import 'package:flutter/material.dart';
import 'drawer.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seconde Page')),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Bienvenue sur la seconde page !')),
    );
  }
}
