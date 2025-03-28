import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/theme_provider.dart';
import 'views/home.dart';

void main() {
  runApp(
    // changeNotifierProvider permet de gérer l'état global de l'application en écoutant les changements de ThemeProvider
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // création d'une instance de ThemeProvider
      child: const MyApp(), // MyApp est le widget racine de l'application
    ),
  );
}

// MyApp est un widget stateless qui définit le thème global de l'application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // provider.of permet d'accéder à l'instance de ThemeProvider pour récupérer et écouter les changements du thème
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'App B3 MDS', 
      theme: ThemeData.light(), // thème clair par défaut
      darkTheme: ThemeData.dark(), // thème sombre si activé
      themeMode: themeProvider.themeMode, // définit le mode du thème selon ThemeProvider
      debugShowCheckedModeBanner: false, // supprime le bandeau "Debug" en mode développement
      home: const HomePage(), // définit la page d'accueil de l'application
    );
  }
}
