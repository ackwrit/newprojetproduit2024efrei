import 'package:flutter/material.dart';
import 'package:amazonmini/controller/my_custom_path.dart';

class MyBackground extends StatefulWidget {
  const MyBackground({super.key});

  @override
  State<MyBackground> createState() => _MyBackgroundState();
}

class _MyBackgroundState extends State<MyBackground> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomPath(),
      child: Container(
        color: Colors.purple,
      ),

    );
  }
}
