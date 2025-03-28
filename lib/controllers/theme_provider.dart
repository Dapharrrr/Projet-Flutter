import 'package:flutter/material.dart';

/// **ThemeProvider** est une classe qui gère l'état du thème de l'application.
/// Elle étend `ChangeNotifier`, ce qui permet d'informer les widgets écoutant
/// ce provider lorsque l'état du thème change.
class ThemeProvider extends ChangeNotifier {
  // Variable privée stockant le mode actuel du thème (clair par défaut)
  ThemeMode _themeMode = ThemeMode.light;

  /// Getter permettant d'accéder au mode actuel du thème
  ThemeMode get themeMode => _themeMode;

  /// Méthode permettant de basculer entre le mode clair et le mode sombre
  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    
    // `notifyListeners()` informe tous les widgets qui écoutent ce provider qu'un changement a eu lieu, afin qu'ils se mettent à jour.
    notifyListeners();
  }
}
