import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'second_page.dart';
import 'about.dart';
import 'contact.dart';
import '../controllers/theme_provider.dart';

/// AppDrawer est un widget représentant le menu latéral de l'application
/// il permet à l'utilisateur de naviguer entre différentes pages et de changer le thème
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // accès au ThemeProvider pour gérer le changement de thème
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // supprime les marges internes par défaut
        children: [
          /// en-tête du menu avec une image de fond
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/shrek.jpg'),
                fit: BoxFit.cover, // ajuste l'image pour qu'elle couvre toute la zone
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft, // position du texte en bas à gauche
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// élément du menu : accueil
          ListTile(
            leading: const Icon(Icons.home), // Icône
            title: const Text('Accueil'), // Texte
            onTap: () {
              // navigation vers la page d'accueil en remplaçant la page actuelle
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),

          /// élément du menu : Seconde Page
          ListTile(
            leading: const Icon(Icons.pages),
            title: const Text('Seconde Page'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
          ),

          /// élément du menu : a propos
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('À propos'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              );
            },
          ),

          /// élément du menu : contact
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ContactPage()),
              );
            },
          ),

          /// séparateur visuel
          const Divider(),

          /// option pour changer le thème clair/sombre
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Changer le thème'),
            trailing: Switch(
              // vérifie si le thème actuel est sombre ou clair
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.toggleTheme(); // change le thème
              },
            ),
          ),
        ],
      ),
    );
  }
}
