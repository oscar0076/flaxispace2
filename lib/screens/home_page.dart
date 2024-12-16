import 'package:flutter/material.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/coworking_card_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Back Mohamed Salah'),
        elevation: 0,
        backgroundColor: Color(0xFF1D1D1D),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for Co-Working places',
                filled: true,
                fillColor: Color(0xFF2F2F2F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Co-Working Spaces',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                CoworkingCardWidget(
                  imageUrl: 'lib/assets/ariana.jpg',
                  title: 'Ariana Co-Working',
                ),
                CoworkingCardWidget(
                  imageUrl: 'lib/assets/images.jpg',
                  title: 'Ghazala Working Space',
                ),
                CoworkingCardWidget(
                  imageUrl: 'lib/assets/téléchargement.jpg',
                  title: 'JS Master Co-Working',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(currentIndex: 0),
    );
  }
}