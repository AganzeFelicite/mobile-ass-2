import 'package:flutter/material.dart';

const int itemCount = 4;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Contact ${(index + 1)}'),
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.call),
          );
        });
  }
}
