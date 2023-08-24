import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/task_data.dart';
import 'screens/tasks_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // builder: (context) => TaskData(),
      create: (BuildContext context) => TaskData(),
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
