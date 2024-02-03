import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Vangti Nai',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                childAspectRatio: 1.6,
              ),
              itemCount: 11,
              itemBuilder: (context, index) {
                if (index == 10) {
                  return NumericButton(
                    label: 'Clear',
                    onPressed: () {
                      clearInput();
                    },
                  );
                } else {
                  return NumericButton(
                    label: '$index',
                    onPressed: () {
                      appendToInput('$index');
                    },
                  );
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(16.0),
            // width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              _input,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void appendToInput(String value) {
    setState(() {
      _input += value;
    });
  }

  void clearInput() {
    setState(() {
      _input = '';
    });
  }
}

class NumericButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  NumericButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 440,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purple,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
