import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../materials/sheet.dart';
import '../materials/tasks_list.dart';
import '../models/task_data.dart';
import 'task_add.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 45.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "Todoey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  )
                ),
                Text(
                  "${Provider.of<TaskData>(context).taskCount} Tasks",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  )
                ),
                const SizedBox(height: 42.0),
              ],
            ),
          ),
          const Expanded(
            child: Sheet(
              child: TasksList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          backgroundColor: const Color(0xff757575),
          context: context,
          isScrollControlled: true,
          isDismissible: true,
          builder: (context) => TaskAdd((newTaskTitle){}),
        ),
      ),
    );
  }
}
