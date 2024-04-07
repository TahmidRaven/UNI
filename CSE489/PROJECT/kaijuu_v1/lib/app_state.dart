import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
