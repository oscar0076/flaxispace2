import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF040720),
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.question_answer, color: Colors.yellow, size: 28),
            SizedBox(width: 10),
            Text(
              "FAQ",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: const FAQBody(),
    );
  }
}

class FAQBody extends StatelessWidget {
  const FAQBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF040720), Color(0xFF1A2A43)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: FAQList(),
      ),
    );
  }
}

class FAQList extends StatelessWidget {
  const FAQList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        FAQItem(
          question: "What is Flexi Space?",
          answer: "Flexi-Space is a coworking platform that offers flexible office spaces for businesses, startups, and freelancers.",
        ),
        FAQItem(
          question: "How do I book a coworking space?",
          answer: "You can book a space through our website or app. Simply select a location, time, and confirm your reservation.",
        ),
        FAQItem(
          question: "What types of spaces do you offer?",
          answer: "We offer private offices, shared workspaces, and meeting rooms, all designed for comfort and productivity.",
        ),
        FAQItem(
          question: "What are the rates for using a space?",
          answer: "The rates vary depending on the space and duration. Visit our website for detailed pricing.",
        ),
        FAQItem(
          question: "Can I cancel or modify my booking?",
          answer: "Yes, you can cancel or modify your booking up to 24 hours before the scheduled time.",
        ),
      ],
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75), // Slight transparency for a modern effect
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.yellow,
                    size: 30,
                  ),
                ],
              ),
            ),
            if (_isExpanded)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(20),
                child: Text(
                  widget.answer,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
