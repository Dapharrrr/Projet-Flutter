import 'package:flutter/material.dart';
import 'dart:convert'; // pour décoder la réponse JSON
import 'package:http/http.dart' as http; // pour effectuer les requêtes HTTP
import 'articles_detail.dart'; 
import 'drawer.dart'; 

/// page des articles : récupère et affiche une liste d'articles à partir d'une API
class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  List articles = []; // liste pour stocker les articles récupérés
  bool isLoading = true; // indicateur de chargement
  bool hasError = false; // indicateur d'erreur lors de la récupération des articles

  @override
  void initState() {
    super.initState();
    fetchArticles(); // appel à la méthode de récupération des articles
  }

  /// méthode pour récupérer les articles depuis l'API
  Future<void> fetchArticles() async {
    const String apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // URL de l'API

    try {
      // envoie de la requête GET pour récupérer les articles
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // si la requête réussit (code 200), décode la réponse JSON et met à jour l'état
        setState(() {
          articles = json.decode(response.body); // décodage des articles en format JSON
          isLoading = false; // fin du chargement
        });
      } else {
        // si la requête échoue (autre code que 200), marque une erreur
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      // si une exception est levée pendant la requête (ex : pas de connexion internet), marque une erreur
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Articles')),
      drawer: const AppDrawer(), 
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // affichage du chargement pendant la récupération des articles
          : hasError
              ? const Center(child: Text('Erreur lors du chargement des articles')) // affichage d'un message d'erreur si la récupération échoue
              : ListView.builder(
                  itemCount: articles.length, // nombre d'articles à afficher
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // espacement autour de chaque carte
                      child: ListTile(
                        leading: const Icon(Icons.article, color: Colors.blue), // icône à gauche de chaque article
                        title: Text(articles[index]['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(articles[index]['body']),
                        onTap: () {
                          // navigation vers la page de détails de l'article
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleDetailPage(article: articles[index]), // passe l'article sélectionné à la page de détails
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
