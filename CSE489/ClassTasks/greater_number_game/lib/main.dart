// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// void main(){
//   runApp(MaterialApp(
//     home: Scaffold(
//       backgroundColor: Colors.lightBlueAccent[100],
//       appBar: AppBar(
//         title: const Text('Hello World'),
//       ),
//       //body: const Center(
//         //child: Text('This is the center'),
//       //),
//     ),
//   ));
// }

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const NumberComparisonGame());
}

class NumberComparisonGame extends StatelessWidget {
  const NumberComparisonGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NumberComparisonScreen(),
    );
  }
}

class NumberComparisonScreen extends StatefulWidget {
  const NumberComparisonScreen({super.key});

  @override
  _NumberComparisonScreenState createState() => _NumberComparisonScreenState();
}

class _NumberComparisonScreenState extends State<NumberComparisonScreen> {
  int _number1 = 0; // Initialize to a default value
  int _number2 = 0; // Initialize to a default value
  int _userScore = 0;

  @override
  void initState() {
    super.initState();
    _generateRandomNumbers();
  }

  void _generateRandomNumbers() {
    setState(() {
      _number1 = Random().nextInt(100) + 1;
      _number2 = Random().nextInt(100) + 1;
    });
  }

  void _compareAndIncrement(String selectedNumber) {
    int selectedValue = selectedNumber == '1' ? _number1 : _number2;
    int otherValue = selectedNumber == '1' ? _number2 : _number1;

    setState(() {
      if (selectedValue > otherValue) {
        _userScore++;
      }
      _generateRandomNumbers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Comparison Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _compareAndIncrement('1');
              },
              child: Text('Number 1: $_number1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _compareAndIncrement('2');
              },
              child: Text('Number 2: $_number2'),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Score: $_userScore',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
