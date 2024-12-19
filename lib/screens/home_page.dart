import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/coworking_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = 'User';

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      print('Current User: ${user?.uid}'); // Debug print

      if (user != null) {
        // First try to get username directly from user object
        if (user.displayName != null && user.displayName!.isNotEmpty) {
          setState(() {
            username = user.displayName!;
          });
          return;
        }

        // If no display name, try Firestore
        print('Fetching from Firestore...'); // Debug print
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        print('Firestore Data: ${userDoc.data()}'); // Debug print

        if (userDoc.exists && mounted) {
          // Try multiple possible field names
          final userData = userDoc.data() as Map<String, dynamic>;
          final fetchedUsername = userData['username'] ??
              userData['name'] ??
              userData['displayName'] ??
              userData['userName'] ??
              'User';

          print('Fetched Username: $fetchedUsername'); // Debug print

          setState(() {
            username = fetchedUsername;
          });
        } else {
          print('User document does not exist'); // Debug print
        }
      } else {
        print('No user is logged in'); // Debug print
      }
    } catch (e) {
      print('Error loading username: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Back $username'),
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
                  imageUrl: 'assets/ariana.jpg',
                  title: 'Ariana Co-Working',
                ),
                CoworkingCardWidget(
                  imageUrl: 'assets/images.jpg',
                  title: 'Ghazala Working Space',
                ),
                CoworkingCardWidget(
                  imageUrl: 'assets/téléchargement.jpg',
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