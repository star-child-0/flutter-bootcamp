import 'package:flutter/material.dart';

import 'destini.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: DestiniPage(),
        ),
      ),
    );
  }
}
