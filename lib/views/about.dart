import 'package:flutter/material.dart';
import 'drawer.dart';

/// page A propos : Cette page fournit des informations sur l'application.
class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('A Propos')), 
      drawer: const AppDrawer(), 
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'A propos de cette application',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cette application a été développée pour démontrer les bases de Flutter. Vous y trouverez une navigation simple avec un menu et plusieurs pages.',
              style: TextStyle(fontSize: 16), 
            ),
            const SizedBox(height: 16),
            const Text(
              'Les fonctionnalités principales incluent :',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              '- Page d\'accueil', 
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Page secondaire', 
              style: TextStyle(fontSize: 16), 
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/Makima.jpeg', // image affichée
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
