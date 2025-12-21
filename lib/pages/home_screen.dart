import 'package:flutter/material.dart';
import 'package:sat_english/pages/daily_tip_screen.dart';
import 'package:sat_english/pages/quick_practise_screen.dart';
import 'package:sat_english/pages/vocabulary_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Greeting
            const Text(
              "Welcome back",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "Let’s improve your SAT English today",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),

            /// Progress Overview
            //_progressCard(),

            const SizedBox(height: 20),

            /// Daily Tip
            _infoCard(
              icon: Icons.lightbulb_outline,
              title: "Daily Tip",
              subtitle:
                  "Read the question first, then scan the passage for clues.",
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const DailyTipScreen(),
                  ),
                );
              },
            ),

            /// Quick Practice
            _infoCard(
              icon: Icons.flash_on,
              title: "Quick Practice",
              subtitle: "5 Questions • 5 Minutes",
              color: Colors.indigo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const QuickPracticeScreen(),
                  ),
                );
              },
            ),

            /// Vocabulary of the Day
            _infoCard(
              icon: Icons.book,
              title: "Vocabulary of the Day",
              subtitle: "Meticulous — great attention to detail",
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const VocabularyScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            /// Today's Focus
            // const Text(
            //   "Today’s Focus",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            // ),
            // const SizedBox(height: 10),

            // Wrap(
            //   spacing: 8,
            //   children: [
            //     _focusChip("Grammar", true),
            //     _focusChip("Reading", false),
            //     _focusChip("Vocabulary", false),
            //   ],
            // ),

            //const SizedBox(height: 30),

            /// Start Practice Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const QuickPracticeScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Start Practice",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Progress Card
  // Widget _progressCard() {
  //   // return Container(
  //   //   padding: const EdgeInsets.all(16),
  //   //   decoration: BoxDecoration(
  //   //     gradient: LinearGradient(
  //   //       colors: [Colors.indigo, Colors.indigo.shade400],
  //   //     ),
  //   //     borderRadius: BorderRadius.circular(16),
  //   //   ),
  //   //   // child: Row(
  //   //   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   //   //   children: const [
  //   //   //     _ProgressItem("🔥 Streak", "4 days"),
  //   //   //     _ProgressItem("✅ Practiced", "12 today"),
  //   //   //     _ProgressItem("🎯 Accuracy", "82%"),
  //   //   //   ],
  //   //   // ),
  //   // );
  // }

  /// Info Card Widget
  Widget _infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  /// Focus Chip
  // Widget _focusChip(String label, bool selected) {
  //   return Chip(
  //     label: Text(label),
  //     backgroundColor:
  //         selected ? Colors.indigo : Colors.indigo.shade50,
  //     labelStyle: TextStyle(
  //       color: selected ? Colors.white : Colors.black,
  //       fontWeight: FontWeight.w500,
  //     ),
  //   );
  // }
}

// class _ProgressItem extends StatelessWidget {
//   final String title;
//   final String value;

//   const _ProgressItem(this.title, this.value);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.white70,
//             fontSize: 12,
//           ),
//         ),
//       ],
//     );
//   }
// }
