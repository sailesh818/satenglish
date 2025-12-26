import 'package:flutter/material.dart';
import 'package:sat_english/pages/about_screen.dart';
import 'package:sat_english/pages/achievements_screen.dart';
//import 'package:sat_english/pages/bookmarks_screen.dart';
import 'pages/home_screen.dart';
import 'pages/practice_screen.dart';
import 'pages/topics_screen.dart';
import 'pages/settings_screen.dart';

void main() {
  runApp(const SatEnglishApp());
}

class SatEnglishApp extends StatelessWidget {
  const SatEnglishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAT English',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 0;

  final pages = const [
    HomeScreen(),
    PracticeScreen(),
    TopicsScreen(),
    //ProgressScreen(),
    SettingsScreen(),
  ];

  final titles = const [
    "Home",
    "Practice",
    "Topics & Lessons",
    //"Progress",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_index]),
        centerTitle: true,
      ),

      drawer: const AppDrawer(),

      body: IndexedStack(
        index: _index,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Practice"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Topics"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}



class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.school, color: Colors.white, size: 40),
                SizedBox(height: 10),
                Text(
                  "SAT English Prep",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Text(
                  "Practice • Improve • Succeed",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          // Bookmarks
          // ListTile(
          //   leading: const Icon(Icons.bookmark),
          //   title: const Text("Bookmarks"),
          //   onTap: () {
          //     Navigator.pop(context); // Close drawer first
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (_) => const BookmarksScreen()),
          //     );
          //   },
          // ),

          // Achievements
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text("Achievements"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AchievementsScreen()),
              );
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
