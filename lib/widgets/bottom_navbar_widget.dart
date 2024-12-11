import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black, // Background color for the nav bar
      selectedItemColor: Colors.orange, // Color for selected item
      unselectedItemColor: Colors.white, // Color for unselected items
      type: BottomNavigationBarType.fixed, // Ensures all items are shown on the same row
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home', // Label for the home button
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Create', // Label for the create button
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile', // Label for the profile button
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          // If 'Home' button is clicked, navigate to the HomePage
          Navigator.pushNamed(context, '/home');
        } else if (index == 1) {
          // If 'Create' button is clicked, navigate to the CreatePage
          Navigator.pushNamed(context, '/create');
        } else if (index == 2) {
          // If 'Profile' button is clicked, navigate to the LoginPage
          Navigator.pushNamed(context, '/profile');
        }
      },
    );
  }
}
