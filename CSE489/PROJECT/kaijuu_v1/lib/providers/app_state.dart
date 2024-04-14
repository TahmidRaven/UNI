import 'package:flutter/material.dart';

class Task {
  final String title;
  final bool isDone;

  Task({required this.title, this.isDone = false});
}

class AppState extends ChangeNotifier {
  int count = 0;
  List<Task> tasks = [
    Task(title: 'Task 1', isDone: false),
    Task(title: 'Task 2', isDone: false),
    Task(title: 'Task 3', isDone: false),
    // Add more tasks as needed
  ];

  void increment() {
    count++;
    notifyListeners();
  }
}
