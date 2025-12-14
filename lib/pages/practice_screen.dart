import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Practice Hub",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            "Choose a section to start practicing",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          _practiceCard(
            context,
            title: "Reading",
            subtitle: "Passages, inference, evidence questions",
            icon: Icons.menu_book,
            color: Colors.indigo,
          ),

          _practiceCard(
            context,
            title: "Writing & Language",
            subtitle: "Grammar, punctuation, sentence structure",
            icon: Icons.edit,
            color: Colors.orange,
          ),

          _practiceCard(
            context,
            title: "Vocabulary",
            subtitle: "SAT words, synonyms, context usage",
            icon: Icons.book,
            color: Colors.green,
          ),

          const SizedBox(height: 24),

          const Text(
            "Practice Modes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              _modeChip("Timed"),
              _modeChip("Untimed"),
              _modeChip("Mixed"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _practiceCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.play_arrow),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const QuizScreen(),
            ),
          );
        },
      ),
    );
  }

  Widget _modeChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.indigo.shade50,
      ),
    );
  }
}
