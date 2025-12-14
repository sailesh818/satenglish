import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Progress",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            "Track your SAT English improvement",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          // Summary Cards
          Row(
            children: const [
              _StatCard(
                title: "Practice Done",
                value: "12",
                icon: Icons.check_circle,
                color: Colors.green,
              ),
              _StatCard(
                title: "Accuracy",
                value: "78%",
                icon: Icons.percent,
                color: Colors.indigo,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Weak Area
          _WeakAreaCard(),

          const SizedBox(height: 24),

          const Text(
            "Section Performance",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          _sectionProgress("Reading", 0.82, Colors.indigo),
          _sectionProgress("Writing & Language", 0.70, Colors.orange),
          _sectionProgress("Vocabulary", 0.75, Colors.green),
        ],
      ),
    );
  }

  Widget _sectionProgress(String title, double progress, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              color: color,
              backgroundColor: color.withOpacity(0.2),
            ),
            const SizedBox(height: 6),
            Text("${(progress * 100).toInt()}% accuracy"),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.only(right: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, color: color),
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(title, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeakAreaCard extends StatelessWidget {
  const _WeakAreaCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const ListTile(
        leading: Icon(Icons.warning_amber_rounded, color: Colors.red),
        title: Text(
          "Weak Area Detected",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text("Writing & Language needs more practice"),
      ),
    );
  }
}
