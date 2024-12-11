import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF040720), Color(0xFF1A2A43)], // Dark purple to light purple gradient
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo and Title
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Column(
                  children: [
                    Image.asset('lib/assets/img_1.png', height: 80),
                    const SizedBox(height: 10),
                    Text(
                      'Flexi-Space',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Image
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'lib/assets/img.png', // Ensure this is the correct path for your image
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
              ),

              // Title and Subtitle
              const SizedBox(height: 30),
              Text(
                'Discover Endless Possibilities\nwith Flexi-space',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Where Creativity Meets Innovation: Embark on a Journey of Limitless Exploration.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),

              // Buttons with Navigation
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup'); // Navigate to the SignUp screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Continue with Email',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 15),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/faqscreen'); // Navigate to the FAQ screen
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Frequently Asked Questions',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(true),
                  _buildDot(false),
                  _buildDot(false),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }

  // Dot indicator for onboarding steps
  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.orangeAccent : Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
