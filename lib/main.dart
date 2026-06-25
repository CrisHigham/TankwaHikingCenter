import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/about_us_page.dart';
import 'pages/map_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tankwa Hiking Center',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  static const List<String> _titles = ['Tankwa Hiking Center', 'Map', 'About Us'];
  static const List<Widget> _bodies = [
    HomePage(),
    MapPage(),
    AboutUsPage(),
  ];

  void _navigate(int index) {
    setState(() => _selectedIndex = index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal[800]),
              child: const Text(
                'Tankwa Hiking Center',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () => _navigate(0),
            ),
            ListTile(
              title: const Text('Map'),
              onTap: () => _navigate(1),
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () => _navigate(2),
            ),
          ],
        ),
      ),
      body: _bodies[_selectedIndex],
    );
  }
}
