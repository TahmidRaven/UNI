import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;
  List<String> _tasks = []; // Initialize tasks list
  List<double> _progressValues = []; // Initialize progress values list

  // Pomodoro Timer related variables
  int _focusMinutes = 25;
  int _shortBreakMinutes = 5;
  int _longBreakMinutes = 15;
  int _focusSessionsCompleted = 0;
  int _currentSession = 1;
  int _seconds = 1500;
  int _cycle = 1;
  bool _isRunning = false;
  String _sessionType = 'FOCUSING';

  int get counter => _counter;
  List<String> get tasks => _tasks; // Getter for tasks list
  List<double> get progressValues => _progressValues; // Getter for progress values list
  int get focusMinutes => _focusMinutes;
  int get shortBreakMinutes => _shortBreakMinutes;
  int get longBreakMinutes => _longBreakMinutes;
  int get focusSessionsCompleted => _focusSessionsCompleted;
  int get currentSession => _currentSession;
  int get seconds => _seconds;
  int get cycles => _cycle;
  bool get isRunning => _isRunning;
  String get sessionType => _sessionType;

  get completedTasksCount => null;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void addTask(String task) {
    _tasks.add(task); // Implement adding task functionality
    initializeProgressValues(); // Initialize progress value for the newly added task
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index); // Implement removing task functionality
    _progressValues.removeAt(index); // Remove progress value corresponding to the removed task
    notifyListeners();
  }

  void completeTask(int index) {
    // Implement completing task functionality, e.g., move the task to completed tasks list
    // For now, let's just remove the task
    _tasks.removeAt(index);
    _progressValues.removeAt(index); // Remove progress value corresponding to the completed task
    notifyListeners();
  }

  void initTasks() {
    _tasks = []; // Initialize tasks list
    _progressValues = []; // Initialize progress values list
  }

  void updateFocusMinutes(int minutes) {
    _focusMinutes = minutes;
    notifyListeners();
  }

  void updateShortBreakMinutes(int minutes) {
    _shortBreakMinutes = minutes;
    notifyListeners();
  }

  void updateLongBreakMinutes(int minutes) {
    _longBreakMinutes = minutes;
    notifyListeners();
  }

  void incrementFocusSessionsCompleted() {
    _focusSessionsCompleted++;
    notifyListeners();
  }

  void incrementCurrentSession() {
    _currentSession++;
    notifyListeners();
  }

  void decrementSeconds() {
    _seconds--;
    notifyListeners();
  }

  void toggleIsRunning() {
    _isRunning = !_isRunning;
    notifyListeners();
  }

  void updateSessionType(String sessionType) {
    _sessionType = sessionType;
    notifyListeners();
  }

  void updateCycles(int cycles) {
    _cycle = cycles;
    notifyListeners();
  }

  void resetTimer() {
    _currentSession = 1;
    _focusSessionsCompleted = 0;
    _sessionType = 'FOCUSING';
    _seconds = _focusMinutes * 60;
    notifyListeners();
  }

  void resetToDefault() {
    _focusMinutes = 25;
    _shortBreakMinutes = 5;
    _longBreakMinutes = 15;
    _cycle = 1;
    resetTimer();
  }

  // Update seconds with the provided value
  void updateSeconds(int seconds) {
    _seconds = seconds;
    notifyListeners();
  }

  // Method to initialize progress values for all tasks
  void initializeProgressValues() {
    _progressValues = List<double>.filled(_tasks.length, 0.0);
    notifyListeners();
  }

  // Method to update the progress value for a specific task
  void setProgressValue(int index, double value) {
    _progressValues[index] = value;
    notifyListeners();
  }
}
