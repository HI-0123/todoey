import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/models/task.dart';
import 'dart:convert';

class SharedPreferenceHelper {
  static String taskList = 'TaskList';

  //save date
  Future<void> setTasks(List<Task> tasks) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(tasks).toString();
    await _prefs.setString(taskList, jsonString);
  }

  // get data
  Future<List<Task>> getTasks() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final jsonString = _prefs.getString(taskList) ?? "";
    final List<dynamic> decodedJson = jsonDecode(jsonString);
    final tasks = decodedJson.map((e) => Task.fromJson(e)).toList();
    return tasks;
  }
}
