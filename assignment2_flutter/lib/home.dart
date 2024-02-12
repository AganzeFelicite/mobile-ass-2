import 'package:flutter/material.dart';
import 'package:helloworld/aganzePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) {
              return const LearnFlutter();
            },
          ));
        },
        child: const Text('Aganze Felicite'),
      ),
    );
  }
}
