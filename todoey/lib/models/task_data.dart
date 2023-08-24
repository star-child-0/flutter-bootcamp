import 'package:flutter/foundation.dart';
import 'dart:collection';

import 'task.dart';

class TaskData extends ChangeNotifier{
  // ignore: prefer_final_fields
  List<Task> _tasks = [
    Task(title: "Hold a task to delete it"),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String newTask) {
    _tasks.add(Task(title: newTask));
    notifyListeners();
  }

  Task getTask(int index) => _tasks[index];

  void updateTask(Task task) {
    task.toggleTask();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
