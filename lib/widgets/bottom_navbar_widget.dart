import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  final int currentIndex;

  // Le constructeur accepte l'index actuel
  BottomNavBarWidget({required this.currentIndex});

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black, // Couleur de fond
      selectedItemColor: Colors.orange, // Couleur de l'élément sélectionné
      unselectedItemColor: Colors.white, // Couleur des éléments non sélectionnés
      type: BottomNavigationBarType.fixed, // Affichage des éléments sur une ligne
      currentIndex: widget.currentIndex, // Définit l'élément actif
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home', // Label pour le bouton "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Create', // Label pour le bouton "Create"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile', // Label pour le bouton "Profile"
        ),
      ],
      onTap: (index) {
        // Logique de navigation basée sur l'index
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/create');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/profile');
        }
      },
    );
  }
}
