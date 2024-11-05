import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';

final taskProvider = ChangeNotifierProvider((ref) => TaskProvider());

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
