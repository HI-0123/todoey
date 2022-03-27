import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/utils/random_string.dart';

part 'task_list_controller.freezed.dart';

@freezed
class TaskListState with _$TaskListState {
  const factory TaskListState({
    @Default(<Task>[]) List<Task> tasks,
  }) = _TaskListState;
}

final taskListProvider =
    StateNotifierProvider.autoDispose<TaskListController, TaskListState>((ref) {
  return TaskListController();
});

class TaskListController extends StateNotifier<TaskListState> {
  TaskListController() : super(const TaskListState()) {
    _init();
  }

  Future<void> _init() async {}

  void addTask(String title) {
    final id = generateNonce();
    final newTask = Task(id: id, title: title);
    final _tasks = [...state.tasks, newTask];
    state = state.copyWith(tasks: _tasks);
  }

  void toggleIsDone(Task task) {
    final _tasks = [...state.tasks];
    final index = _tasks.indexOf(task);
    final toggledTask = task.copyWith(isDone: !task.isDone);
    _tasks.replaceRange(index, index + 1, [toggledTask]);
    state = state.copyWith(tasks: _tasks);
  }

  void deleteTask(Task task) {
    final _tasks = [...state.tasks];
    final index = _tasks.indexOf(task);
    _tasks.removeAt(index);
    state = state.copyWith(tasks: _tasks);
  }
}
