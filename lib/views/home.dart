import 'package:flutter/material.dart';
import 'drawer.dart'; 

/// homepage est un widget représentant la page d'accueil de l'application.

class HomePage extends StatelessWidget {
  // constructeur constant de la classe
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page d\'accueil'),
      ),
      drawer: const AppDrawer(), // appel du drawer (menu de navigation)
      body: const Center(
        child: Text('Bienvenue sur la page d\'accueil !'), // message de bienvenue affiché au centre de l'écran
      ),
    );
  }
}
