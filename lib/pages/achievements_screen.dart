import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Achievements"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _AchievementTile(
            icon: Icons.local_fire_department,
            title: "4-Day Streak",
            subtitle: "Practice 4 days in a row",
            unlocked: true,
          ),
          _AchievementTile(
            icon: Icons.flash_on,
            title: "Quick Thinker",
            subtitle: "Complete a quick practice session",
            unlocked: true,
          ),
          _AchievementTile(
            icon: Icons.menu_book,
            title: "Grammar Pro",
            subtitle: "Complete 20 grammar questions",
            unlocked: false,
          ),
          _AchievementTile(
            icon: Icons.star,
            title: "Vocabulary Master",
            subtitle: "Learn 50 SAT words",
            unlocked: false,
          ),
        ],
      ),
    );
  }
}

class _AchievementTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool unlocked;

  const _AchievementTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: unlocked ? 4 : 1,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: unlocked
              ? Colors.green.withOpacity(0.15)
              : Colors.grey.withOpacity(0.15),
          child: Icon(
            icon,
            color: unlocked ? Colors.green : Colors.grey,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: unlocked ? Colors.black : Colors.grey,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: unlocked ? Colors.black54 : Colors.grey,
          ),
        ),
        trailing: Icon(
          unlocked ? Icons.check_circle : Icons.lock,
          color: unlocked ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
