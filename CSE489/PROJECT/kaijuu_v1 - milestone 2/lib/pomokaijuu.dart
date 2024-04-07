import 'package:flutter/material.dart';
import 'dart:async';

class PomoKaijuu extends StatefulWidget {
  @override
  _PomoKaijuuState createState() => _PomoKaijuuState();
}

class _PomoKaijuuState extends State<PomoKaijuu> {
  int _workSeconds = 5;
  int _shortBreakSeconds = 3;
  int _longBreakSeconds = 7;
  int _focusSessionsCompleted = 0;
  int _currentSession = 1;
  int _seconds = 5;
  late Timer _timer;
  bool _isRunning = false;
  String _sessionType = 'FOCUSING';
  int _cycle = 1;

  void _startTimer() {
    int totalSessions = 3 * 2; // 3 focus sessions + 3 short breaks = 6 sessions
    int currentSession = 1;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (currentSession <= totalSessions) {
            // Alternate between focus sessions and short breaks
            if (currentSession % 2 != 0) {
              _sessionType = 'FOCUSING';
              _seconds = _workSeconds;
            } else {
              _sessionType = 'COFFEE?';
              _seconds = _shortBreakSeconds;
            }
            currentSession++;

            if (currentSession == totalSessions + 1) {
              // Last session before long break
              _sessionType = 'FOCUSING';
              _seconds = _workSeconds;
            }
          } else {
            // After completing all focus sessions and short breaks
            _sessionType = 'Take a long break';
            _seconds = _longBreakSeconds;
            _timer.cancel(); // Timer stops after long break
          }
        }
      });
    });
  }

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

  void _resetTimer() {
    _timer.cancel();
    _isRunning = false;
    _currentSession = 1;
    _focusSessionsCompleted = 0;
    _cycle = 1;
    _sessionType = 'FOCUSING';
    _seconds = _workSeconds;
    setState(() {});
  }

  void _resetToDefault() {
    setState(() {
      _workSeconds = 5;
      _shortBreakSeconds = 3;
      _longBreakSeconds = 7;
      _cycle = 1;
      _resetTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            _sessionType,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey[900],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$_seconds',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _toggleTimer,
                        child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _resetTimer,
                        child: Icon(Icons.refresh),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: _resetToDefault,
                          child: Icon(Icons.refresh),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text('Timer Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Work: ', style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 60,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _workSeconds = int.tryParse(value) ?? _workSeconds;
                },
                controller: TextEditingController(text: _workSeconds.toString()),
              ),
            ),
            Text(' sec', style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Short Break: ', style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 60,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _shortBreakSeconds = int.tryParse(value) ?? _shortBreakSeconds;
                },
                controller: TextEditingController(text: _shortBreakSeconds.toString()),
              ),
            ),
            Text(' sec', style: TextStyle(color: Colors.white)),
            SizedBox(width: 20),
            Text('Long Break: ', style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 60,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _longBreakSeconds = int.tryParse(value) ?? _longBreakSeconds;
                },
                controller: TextEditingController(text: _longBreakSeconds.toString()),
              ),
            ),
            Text(' sec', style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cycles: ', style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 60,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _cycle = int.tryParse(value) ?? _cycle;
                },
                controller: TextEditingController(text: _cycle.toString()),
              ),
            ),
          ],
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
