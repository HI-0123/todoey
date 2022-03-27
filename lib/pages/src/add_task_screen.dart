import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoey/controllers/task_list_controller.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";

    return Consumer(builder: (context, ref, _) {
      return Container(
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              ElevatedButton(
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (newTaskTitle.isNotEmpty) {
                    ref.read(taskListProvider.notifier).addTask(newTaskTitle);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
