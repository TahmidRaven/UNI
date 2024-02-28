import 'package:flutter/material.dart';
import 'check_battery.dart';

class GuessBatteryHealthPage extends StatefulWidget {
  @override
  _GuessBatteryHealthPageState createState() => _GuessBatteryHealthPageState();
}

class _GuessBatteryHealthPageState extends State<GuessBatteryHealthPage> {
  double guessedPercentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess Battery Health'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter your guess for remaining battery percentage:', style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  guessedPercentage = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Percentage',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,  
                fontWeight: FontWeight.bold,
                  ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckBatteryPage(
                      guessedPercentage: guessedPercentage,
                    ),
                  ),
                );
              },
              child: Text('Check'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[900],
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
