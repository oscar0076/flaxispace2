import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/AddWorkspacePage.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/profile_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/onboardingscreen.dart';
import 'screens/faq.dart';
import 'screens/set_location.dart';
import "firebase_options.dart";
import 'screens/coworkingprofile.dart';
import 'screens/booking.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flexi-Space',  // Change the app name here
      theme: ThemeData.dark(),
      initialRoute: '/',  // Set the initial page route
      routes: {
        '/': (context) => OnboardingScreen(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/login': (context) => LoginPage(),  // Login route
        '/signup': (context) => SignUpPage(),  // SignUp route
        '/create':(context) => AddWorkspacePage(),
        '/faqscreen': (context) => FAQScreen(),
        '/setlocation':(context) =>SetLocationPage(),
        '/coworkingscreen': (context) => CoworkingSpaceProfile(),
        '/booking': (context) => Booking(),
      },
    );
  }
}
