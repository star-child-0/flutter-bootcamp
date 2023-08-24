import 'package:flutter/material.dart';

import 'screens/loading.dart';
import 'screens/location_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Clima",
      routes: {
        "/": (context) => const LoadingScreen(),
        "/location": (context) => const LocationScreen(),
      },
    );
  }
}
