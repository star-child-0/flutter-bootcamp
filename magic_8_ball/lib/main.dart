import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: const Text('Magic 8 Ball'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: const Magic8Ball(),
      ),
    ),
  );
}

class Magic8Ball extends StatefulWidget {
  const Magic8Ball({super.key});

  @override
  State<Magic8Ball> createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset('images/ball$ballNumber.png'),
      ),
    );
  }
}
