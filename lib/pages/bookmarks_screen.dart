import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarks"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _bookmarkCard(
            title: "Subject–Verb Agreement",
            type: "Grammar",
            description: "Rules to match subjects with correct verbs.",
          ),
          _bookmarkCard(
            title: "Meticulous",
            type: "Vocabulary",
            description: "Meaning, synonyms, and SAT usage.",
          ),
          _bookmarkCard(
            title: "Inference Questions",
            type: "Reading",
            description: "How to infer meaning from passages.",
          ),
        ],
      ),
    );
  }

  Widget _bookmarkCard({
    required String title,
    required String type,
    required String description,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.withOpacity(0.15),
          child: const Icon(Icons.bookmark, color: Colors.indigo),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text("$type • $description"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigate to lesson / vocab detail later
        },
      ),
    );
  }
}
