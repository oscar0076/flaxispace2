import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/bottom_navbar_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _profileImageUrl = "";
  String _name = "Default User";
  String _email = "user@example.com";
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Chargement des données utilisateur
  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _name = user.displayName ?? "Default User";
        _email = user.email ?? "user@example.com";
      });

      // Vérifier si l'utilisateur existe dans Firestore
      final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final userData = await userRef.get();

      if (userData.exists) {
        // Si l'utilisateur existe, charger l'URL de l'image
        setState(() {
          _profileImageUrl = userData['profileImageUrl'] ?? "";
        });
      } else {
        // Si l'utilisateur n'existe pas, créer un document pour lui
        await userRef.set({
          'name': user.displayName ?? 'Default User',
          'email': user.email ?? 'user@example.com',
          'profileImageUrl': '',
        });
      }
    }
  }

  // Sélectionner et téléverser une image sur Cloudinary
  Future<void> _selectAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      final cloudinaryUrl = Uri.parse("https://api.cloudinary.com/v1_1/dqjrp8mrc/image/upload");

      final request = http.MultipartRequest('POST', cloudinaryUrl)
        ..fields['upload_preset'] = "flexi-space"
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final imageUrl = json.decode(responseData.body)['secure_url'];

        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Mettre à jour Firestore avec l'URL de l'image
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({'profileImageUrl': imageUrl});

          setState(() {
            _profileImageUrl = imageUrl;
          });
        }
      } else {
        print("Erreur lors du téléversement vers Cloudinary");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1D1D),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFF2F2F2F), // Dark background for the AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _profileImageUrl.isEmpty
                        ? const AssetImage("assets/utilisateur.jpg")
                        : NetworkImage(_profileImageUrl) as ImageProvider<Object>,
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _email,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _selectAndUploadImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9500),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Change Profile Picture",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            // Section réservations actives
            Container(
              color: const Color(0xFF2F2F2F),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Active Reservations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _ReservationCard(
                          imageUrl: 'assets/images.jpg',
                          title: 'Workspace 1',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _ReservationCard(
                          imageUrl: 'assets/images.jpg',
                          title: 'Workspace 2',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(currentIndex: 2),
    );
  }

  // Carte de réservation intégrée dans la page de profil
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
