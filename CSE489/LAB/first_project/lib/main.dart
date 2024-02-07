import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Space Grotesk'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Vangti nai, mama!',
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 244, 211, 211)),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return ChangeCalc(orientation: orientation);
          },
        ),
      ),
    );
  }
}

class ChangeCalc extends StatefulWidget {
  final Orientation? orientation;

  ChangeCalc({Key? key, this.orientation}) : super(key: key);

  @override
  _ChangeCalcState createState() => _ChangeCalcState();
}

class _ChangeCalcState extends State<ChangeCalc> {
  String inp = '';

  void append2input(String digit) {
    setState(() {
      inp += digit;
    });
  }

  void clearInput() {
    setState(() {
      inp = '';
    });
  }

  Map<int, int> calculateChange(int amount) {
    Map<int, int> changeMap = {
      500: 0,
      200: 0,
      100: 0,
      50: 0,
      20: 0,
      10: 0,
      5: 0,
      2: 0,
      1: 0,
    };

    List<int> notes = [500, 200, 100, 50, 20, 10, 5, 2, 1];

    for (int note in notes) {
      if (amount >= note) {
        int count = amount ~/ note;
        changeMap[note] = count;
        amount = amount % note; 
      }
    }

    return changeMap;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: widget.orientation == Orientation.portrait
          ? _buildPortraitLayout()
          : _buildLandscapeLayout(),
    );
  }

  Widget _buildPortraitLayout() {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0.5,
                  mainAxisSpacing: 1.0,
                  childAspectRatio: 1.5,
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
                        append2input('$index');
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TAKA: $inp',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              ...calculateChange(int.tryParse(inp) ?? 0).entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${entry.key}:',
                        style: TextStyle(fontSize: 16.0, color: Color(0xFF030D53)),
                      ),
                      Text(
                        '${entry.value}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0.5,
            mainAxisSpacing: 1.0,
            childAspectRatio: 1.5,
          ),
          itemCount: 11,
          itemBuilder: (context, index) {
            if (index == 10) {
              return NumericButton(
                label: 'Clear',
                onPressed: () {
                  clearInput();
                  setState(() {});
                },
              );
            } else {
              return NumericButton(
                label: '$index',
                onPressed: () {
                  append2input('$index');
                  setState(() {});
                },
              );
            }
          },
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TAKA: $inp',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        ...calculateChange(int.tryParse(inp) ?? 0).entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${entry.key}:',
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF030D53)),
                ),
                Text(
                  '${entry.value}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          );
        }).toList(),
        SizedBox(height: 20.0),
      ],
    ),
  );
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
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 47, 30, 50),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
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
