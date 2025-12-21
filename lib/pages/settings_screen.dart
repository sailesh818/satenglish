import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Settings",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            "Customize your learning experience",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          // _settingsSection(
          //   title: "Appearance",
          //   children: const [
          //     _SettingTile(
          //       icon: Icons.dark_mode,
          //       title: "Dark Mode",
          //       subtitle: "Reduce eye strain at night",
          //       trailing: Switch(value: false, onChanged: null),
          //     ),
          //   ],
          // ),

          // _settingsSection(
          //   title: "Notifications",
          //   children: const [
          //     _SettingTile(
          //       icon: Icons.notifications_active,
          //       title: "Practice Reminders",
          //       subtitle: "Daily SAT practice alerts",
          //       trailing: Switch(value: true, onChanged: null),
          //     ),
          //   ],
          // ),

          // _settingsSection(
          //   title: "Data & Progress",
          //   children: [
          //     _SettingTile(
          //       icon: Icons.restart_alt,
          //       title: "Reset Progress",
          //       subtitle: "Clear all practice data",
          //       trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          //       onTap: () {
          //         _showResetDialog(context);
          //       },
          //     ),
          //   ],
          // ),

          _settingsSection(
            title: "About",
            children: const [
              _SettingTile(
                icon: Icons.info_outline,
                title: "App Version",
                subtitle: "1.0.0",
              ),
              
            ],
          ),
        ],
      ),
    );
  }

  Widget _settingsSection({
    required String title,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  // void _showResetDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: const Text("Reset Progress"),
  //       content:
  //           const Text("Are you sure you want to reset all your progress?"),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text("Cancel"),
  //         ),
  //         ElevatedButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             // Reset logic later
  //           },
  //           child: const Text("Reset"),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  //final Widget? trailing;
  //final VoidCallback? onTap;

  const _SettingTile({
    required this.icon,
    required this.title,
    this.subtitle,
    //this.trailing,
    //this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      //trailing: trailing,
      //onTap: onTap,
    );
  }
}
