// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:helloworld/calculator.dart';
import 'package:helloworld/home.dart';
import 'package:helloworld/profile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  int selectedDrawerIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    CalculatorPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        title: const Text(
          'My app',
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.amberAccent.shade100,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Student'),
              accountEmail: const Text('Aganz1844'),
              currentAccountPicture: CircleAvatar(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://yt3.ggpht.com/yti/AGOGRCqRoGVo7HNdibQ0KsHb6H5cdjAmfEXt1JQHi7_sIw=s88-c-k-c0x00ffffff-no-rj'),
                  radius: 50.0,
                ),
              ),
            ),
            buildDrawerItem(0, 'Home', Icons.home),
            buildDrawerItem(1, 'Calculator', Icons.calculate),
            buildDrawerItem(2, 'Contacts', Icons.person),
            buildDrawerItem(3, 'Contacts', Icons.search),
          ],
        ),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.amber),
            label: 'Home',
          ),
          NavigationDestination(
              icon: Icon(Icons.calculate, color: Colors.amber),
              label: 'Calculator'),
          NavigationDestination(
              icon: Icon(Icons.person, color: Colors.amber), label: 'People'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }

  ListTile buildDrawerItem(int index, String title, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        // Navigate to the corresponding page and update the selected index
        Navigator.pop(context); // Close the drawer
        setState(() {
          currentPage = index;
          selectedDrawerIndex = index;
        });
      },
      selected: selectedDrawerIndex == index, // Highlight the selected item
    );
  }
}
