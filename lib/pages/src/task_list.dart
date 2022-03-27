import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoey/controllers/task_list_controller.dart';
import 'package:todoey/pages/src/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final tasks = ref.watch(taskListProvider.select((s) => s.tasks));
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            final notifier = ref.read(taskListProvider.notifier);
            return TaskTile(
              taskTitle: task.title,
              isDone: task.isDone,
              longPressCallback: () => notifier.deleteTask(task),
              checkboxCallback: () => notifier.toggleIsDone(task),
            );
          },
        );
      },
    );
  }
}
