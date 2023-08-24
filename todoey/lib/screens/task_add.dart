import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../materials/sheet.dart';
import '../models/task_data.dart';

class TaskAdd extends StatelessWidget {
  final Function addTaskCallback;

  const TaskAdd(this.addTaskCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Sheet(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60.0,
              vertical: 20.0
            ),
            child: Column(
              children: [
                const Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  )
                ),
                const SizedBox(height: 10.0),
                TextField(
                  autofocus: true,
                  onChanged: (value) => newTaskTitle = value,
                  onSubmitted: (value) => addTaskCallback(value),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "Enter a task",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent
                  ),
                  onPressed: (){
                    Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
