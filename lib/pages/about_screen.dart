import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "About SAT English Prep",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "SAT English Prep is designed to help students improve their SAT English skills efficiently. "
              "With daily tips, quick practice sessions, vocabulary lessons, and progress tracking, "
              "students can sharpen grammar, reading, and writing abilities effectively.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            
            Text(
              "Developed by: App Coding",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
