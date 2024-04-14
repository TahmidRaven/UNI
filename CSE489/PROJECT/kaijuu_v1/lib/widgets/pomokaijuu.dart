import 'package:flutter/material.dart';
import 'dart:async';

class PomoKaijuu extends StatefulWidget {
  @override
  _PomoKaijuuState createState() => _PomoKaijuuState();
}

class _PomoKaijuuState extends State<PomoKaijuu> {
  int _workSeconds = 25 * 60; // Default work session time: 25 minutes
  int _shortBreakSeconds = 5 * 60; // Default short break time: 5 minutes
  int _longBreakSeconds = 15 * 60; // Default long break time: 15 minutes
  int _seconds = 25 * 60; // Initial seconds for work session
  late Timer _timer;
  bool _isRunning = false;
  String _sessionType = 'FOCUSING';

  // Method to start the timer
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          // Timer reached 0
          _timer.cancel();
          // Switch session type and reset timer
          if (_sessionType == 'FOCUSING') {
            _sessionType = 'BREAK';
            _seconds = _shortBreakSeconds;
          } else if (_sessionType == 'BREAK') {
            _sessionType = 'FOCUSING';
            _seconds = _workSeconds;
          }
        }
      });
    });
  }

  // Method to toggle the timer
  void _toggleTimer() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _startTimer();
      } else {
        _timer.cancel();
      }
    });
  }

  // Method to reset the timer
  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _seconds = _workSeconds;
      _sessionType = 'FOCUSING';
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _sessionType,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        Text(
          '${(_seconds / 60).floor().toString().padLeft(2, '0')}:${(_seconds % 60).toString().padLeft(2, '0')}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _toggleTimer,
          child: Text(_isRunning ? 'Pause' : 'Start'),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _resetTimer,
          child: Text('Reset'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
