import 'package:flutter/material.dart';

/// page de détails de l'article : affiche les informations détaillées d'un article
class ArticleDetailPage extends StatelessWidget {
  final Map<String, dynamic> article; // article à afficher, passé en paramètre lors de la navigation

  // constructeur de la classe, l'article est requis
  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article['title'])), 
      body: Padding(
        padding: const EdgeInsets.all(16.0), // padding autour du contenu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article['title'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              article['body'],
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
