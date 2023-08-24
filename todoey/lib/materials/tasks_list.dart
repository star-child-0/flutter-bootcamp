import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) => ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.getTask(index);
            return TaskTile(
              title: task.title,
              isChecked: task.isChecked,
              onChanged: (value) => taskData.updateTask(task),
              onLongPress: () => taskData.removeTask(task),
            );
          }
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onChanged;
  final Function() onLongPress;

  const TaskTile({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        title,
        style: isChecked ? const TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        ) : null,
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) => onChanged(value),
      )
    );
  }
}
