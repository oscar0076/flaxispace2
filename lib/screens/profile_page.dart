import 'package:flutter/material.dart';
import '../widgets/bottom_navbar_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1D1D),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Background image with a gradient overlay
                Positioned.fill(
                  child: Image.asset(
                    'lib/assets/téléchargement.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile Picture
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('lib/assets/téléchargement.jpg'),
                      ),
                      SizedBox(height: 16),
                      // User Name
                      Text(
                        'Mohamed Salah',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      // User Email
                      Text(
                        'mohamed@example.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 24),
                      // Edit Profile Button
                      ElevatedButton(
                        onPressed: () {
                          // Add logic for editing profile if needed
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFF9500),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFF2F2F2F),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active Reservations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _ReservationCard(
                        imageUrl: 'lib/assets/images.jpg',
                        title: 'Workspace 1',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _ReservationCard(
                        imageUrl: 'lib/assets/images.jpg',
                        title: 'Workspace 2',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BottomNavBarWidget(), // Bottom nav bar
        ],
      ),
    );
  }

  // Integrated _ReservationCard within ProfilePage
  Widget _ReservationCard({required String imageUrl, required String title}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Color(0xFF333333), // Dark background for each card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
