import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/models/task.dart';
import 'dart:convert';

class SharedPreferenceHelper {
  static String taskList = 'TaskList';

  //save date
  Future<void> setTasks(List<Task> tasks) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(tasks).toString();
    // final taskStringList =
    //     tasks.map((task) => task.toJson().toString()).toList();
    await _prefs.setString(taskList, jsonString);
  }

  // get data
  Future<List<Task>> getTasks() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final jsonString = _prefs.getString(taskList) ?? [];
    // final tasks = taskStringList.map((task) {
    //   print(jsonEncode(task));
    // }).toList();
    print(jsonString);
    return [];
  }
}
