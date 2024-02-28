import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

class CheckBatteryPage extends StatefulWidget {
  final double guessedPercentage;

  CheckBatteryPage({required this.guessedPercentage});

  @override
  _CheckBatteryPageState createState() => _CheckBatteryPageState();
}

class _CheckBatteryPageState extends State<CheckBatteryPage> {
  Battery _battery = Battery();
  int _batteryLevel = 0;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      _getBatteryLevel();
    });
  }

  Future<void> _getBatteryLevel() async {
    final batteryLevel = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Battery'),
        backgroundColor: Colors.blueGrey[900],  
        elevation: 0,
        foregroundColor: Colors.white,  
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your guessed percentage: ${widget.guessedPercentage}', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Actual percentage: $_batteryLevel', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            if (widget.guessedPercentage == _batteryLevel)
              Text('Congrats! You were correct ^_^.', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))
            else
              Text('Oh, no!!! your guess was wrong *_* .', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,  
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Colors.blueGrey[900],
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Will work on home button press
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Will work on favorite button press
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Will work on settings button press
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
