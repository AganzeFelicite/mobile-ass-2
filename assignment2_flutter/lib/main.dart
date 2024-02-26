// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:helloworld/calculator.dart';
import 'package:helloworld/home.dart';
import 'package:helloworld/profile.dart';
import 'package:helloworld/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('darkMode') ?? false;

  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;

  const MyApp({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode
          ? ThemeData(
              brightness: Brightness.dark,
            )
          : ThemeData(
              brightness: Brightness.light,
            ),
      // home: RootPage(
      //   onThemeChanged: (bool isDarkMode) {
      //     setState(() {
      //       this.isDarkMode = isDarkMode;
      //     });
      //   },
      // ),
      home: Login(),
    );
  }
}

class RootPage extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const RootPage({Key? key, required this.onThemeChanged}) : super(key: key);

  @override
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
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          'My app',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              bool darkMode = prefs.getBool('darkMode') ?? false;

              setState(() {
                darkMode = !darkMode;
                widget.onThemeChanged(darkMode);
                prefs.setBool('darkMode', darkMode);
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Student',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              accountEmail: const Text('Aganz1844',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate, color: Colors.white),
              label: 'Calculator'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white), label: 'People'),
        ],
        currentIndex: currentPage,
        onTap: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedItemColor: Colors.white,
        // backgroundColor: Colors.blue,
      ),
    );
  }

  ListTile buildDrawerItem(int index, String title, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentPage = index;
          selectedDrawerIndex = index;
        });
      },
      selected: selectedDrawerIndex == index,
    );
  }
}
