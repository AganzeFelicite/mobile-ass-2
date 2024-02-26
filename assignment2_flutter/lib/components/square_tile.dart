import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  SquareTile({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        width: 100.0,
        child: Image.network(
          imagePath,
          height: 40.0,
        ),
      ),
    );
  }
}
