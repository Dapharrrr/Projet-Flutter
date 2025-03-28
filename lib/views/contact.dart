import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer.dart';

/// page de contact : permet aux utilisateurs d'envoyer un message par e-mail
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  // clé globale pour gérer le formulaire et sa validation
  final _formKey = GlobalKey<FormState>();

  // contrôleurs pour récupérer les valeurs saisies par l'utilisateur
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  /// méthode pour envoyer un message par e-mail
  ///
  /// utilise `url_launcher` pour ouvrir l'application mail avec un pré-remplissage
  Future<void> _sendEmail(String name, String email, String message) async {
    // encodage du sujet et du corps du message pour éviter les erreurs dans l'URL
    final subject = Uri.encodeComponent('Nouveau message de contact');
    final body = Uri.encodeComponent('''
Nom : $name
Email : $email

Message :
$message
''');

    // construction de l'URL mailto
    final uri = Uri.parse('mailto:rapha1004@outlook.fr?subject=$subject&body=$body');

    // vérifie si l'application mail peut être ouverte et l'ouvre
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // affiche un message d'erreur si l'application mail ne peut pas être ouverte
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d\'ouvrir l\'application mail.')),
      );
    }
  }

  /// méthode appelée lors de l'envoi du formulaire
  void _submitForm() {
    // vérifie si tous les champs sont valides
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final message = _messageController.text;

      _sendEmail(name, email, message); // envoi du mail

      // affichage d'un message de confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message envoyé avec succès !')),
      );

      // réinitialisation des champs après l'envoi
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')), 
      drawer: const AppDrawer(), 
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Form(
          key: _formKey, // associe le formulaire à la clé globale pour la validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// champ de saisie pour le nom
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer votre nom' : null,
              ),

              /// champ de saisie pour l'email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress, // spécifie un clavier adapté aux emails
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer un email valide' : null,
              ),

              /// champ de saisie pour le message
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: 'Message'),
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer un message' : null,
              ),

              const SizedBox(height: 20), 

              /// bouton pour envoyer le message
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm, // appelle la méthode de validation et d'envoi
                  child: const Text('Envoyer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
