import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

class PomoKaijuuStateful extends StatefulWidget {
  @override
  _PomoKaijuuState createState() => _PomoKaijuuState();
}

class _PomoKaijuuState extends State<PomoKaijuuStateful> {
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      body: Consumer<CounterProvider>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  provider.sessionType,
                  style: TextStyle(
                    color: Colors.black,
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
                          '${(provider.seconds / 60).floor().toString().padLeft(2, '0')}:${(provider.seconds % 60).toString().padLeft(2, '0')}',
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
                              child: Icon(provider.isRunning ? Icons.pause : Icons.play_arrow),
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
                            ElevatedButton(
                              onPressed: _resetToDefault,
                              child: Text("Reset"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    'Focus Sessions Left: ${provider.focusSessionsCompleted}/${provider.cycles * 4}',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[900],
                ),
                child: Column(
                  children: [
                    Text(
                      'Timer Settings',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSettingTextField('Focus', provider.focusMinutes, (value) {
                          counterProvider.updateFocusMinutes(int.tryParse(value) ?? provider.focusMinutes);
                        }),
                        SizedBox(width: 20),
                        _buildSettingTextField('Short Break', provider.shortBreakMinutes, (value) {
                          counterProvider.updateShortBreakMinutes(int.tryParse(value) ?? provider.shortBreakMinutes);
                        }),
                        SizedBox(width: 20),
                        _buildSettingTextField('Long Break', provider.longBreakMinutes, (value) {
                          counterProvider.updateLongBreakMinutes(int.tryParse(value) ?? provider.longBreakMinutes);
                        }),
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
                              counterProvider.updateCycles(int.tryParse(value) ?? provider.cycles);
                            },
                            controller: TextEditingController(text: provider.cycles.toString()),
                            style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSettingTextField(String label, int value, ValueChanged<String> onChanged) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        SizedBox(
          width: 60,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: onChanged,
            controller: TextEditingController(text: value.toString()),
            style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        ),
        Text('min', style: TextStyle(color: Colors.white)),
      ],
    );
  }

  void _toggleTimer() {
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    setState(() {
      counterProvider.toggleIsRunning();
      if (counterProvider.isRunning) {
        _startTimer();
      } else {
        _timer.cancel();
      }
    });
  }

  void _startTimer() {
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    int totalSessions = counterProvider.cycles * 4;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counterProvider.seconds > 0) {
          counterProvider.decrementSeconds();
        } else {
          if (counterProvider.currentSession <= totalSessions) {
            if (counterProvider.sessionType == 'FOCUSING') {
              counterProvider.updateSessionType('SHORT BREAK');
              counterProvider.updateSeconds(counterProvider.shortBreakMinutes * 60);
            } else if (counterProvider.sessionType == 'SHORT BREAK') {
              counterProvider.updateSessionType('FOCUSING');
              counterProvider.incrementFocusSessionsCompleted();
              if (counterProvider.focusSessionsCompleted % 4 == 0) {
                counterProvider.updateSessionType('LONG BREAK');
                counterProvider.updateSeconds(counterProvider.longBreakMinutes * 60);
              } else {
                counterProvider.updateSeconds(counterProvider.focusMinutes * 60);
              }
            } else if (counterProvider.sessionType == 'LONG BREAK') {
              counterProvider.updateSessionType('FOCUSING');
              counterProvider.updateSeconds(counterProvider.focusMinutes * 60);
            }
            counterProvider.incrementCurrentSession();
          } else {
            _resetTimer();
          }
        }
      });
    });
  }

  void _resetTimer() {
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    _timer.cancel();
    counterProvider.resetTimer();
    setState(() {});
  }

  void _resetToDefault() {
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    counterProvider.resetToDefault();
    setState(() {});
  }
}
