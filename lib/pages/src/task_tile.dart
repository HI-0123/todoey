import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.isDone,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  }) : super(key: key);

  final bool isDone;
  final String taskTitle;
  final void Function() checkboxCallback;
  final void Function() longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style:
            TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isDone,
        onChanged: (value) => checkboxCallback(),
      ),
    );
  }
}
