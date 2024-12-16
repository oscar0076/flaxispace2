import 'package:flutter/material.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/coworking_card_widget.dart';
import '../screens/set_location.dart';

class AddWorkspacePage extends StatefulWidget {
  @override
  _AddWorkspacePageState createState() => _AddWorkspacePageState();
}

class _AddWorkspacePageState extends State<AddWorkspacePage> {
  // Initialisation des contrôleurs de texte
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    // Libération des contrôleurs lorsque la page est supprimée
    _descriptionController.dispose();
    _priceController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1D1D), // Fond sombre
      appBar: AppBar(
        backgroundColor: Color(0xFF2F2F2F),
        title: Text(
          'Add a Workspace',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Retour à l'écran précédent
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Permet le défilement si l'écran est petit
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload Photos',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, size: 30, color: Colors.white),
                    padding: const EdgeInsets.only(right: 50.0),
                    onPressed: () {
                      // Fonction pour télécharger des photos
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildTextField('Add a description', _descriptionController),
              SizedBox(height: 20),
              buildTextField('Add the price', _priceController),
              SizedBox(height: 20),
              buildTextField('Add the location manually', _locationController),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/setlocation');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Couleur du bouton
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Set location',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(currentIndex: 1),    // Ajouter la barre de navigation en bas
    );
  }

  // Méthode pour créer un champ de texte personnalisé
  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label, // Affiche le label au-dessus du champ
          style: TextStyle(color: Colors.grey, fontSize: 16), // Style du label
        ),
        SizedBox(height: 8), // Espace entre le label et le TextField
        TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
