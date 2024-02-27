import 'package:flutter/material.dart';
import 'input_txt.dart';  

class MyDropdownMenu extends StatefulWidget {
  const MyDropdownMenu({Key? key}) : super(key: key);

  @override
  _MyDropdownMenuState createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  String? selectedOption;
  Color boxColor = Colors.blueGrey[400]!;
  Color buttonColor = Colors.blueGrey[400]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _showOptionsDialog(context);
          },
          child: Container(
            width: 200,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              selectedOption ?? 'Choose an option',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 22),
        ElevatedButton(
          onPressed: () {
            // Navigate to the input text page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InputTextPage()),
            );
          },
          child: Text(
            'Go!',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          ),
        ),
      ],
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an option'),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                RadioListTile<String>(
                  title: Text(
                    'Broadcast Text',
                    style: TextStyle(color: Colors.black),
                  ),
                  value: 'Broadcast Text',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value;
                      boxColor = Colors.blueGrey[900]!;
                      buttonColor = Colors.blueGrey[900]!;
                    });
                    Navigator.pop(context);
                  },
                ),
                RadioListTile<String>(
                  title: const Text(
                    'Wifi State',
                    style: TextStyle(color: Colors.black),
                  ),
                  value: 'Wifi State',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value;
                      boxColor = Colors.blueGrey[900]!;
                      buttonColor = Colors.blueGrey[900]!;
                    });
                    Navigator.pop(context);
                  },
                ),
                RadioListTile<String>(
                  title: Text(
                    'Battery Health',
                    style: TextStyle(color: Colors.black),
                  ),
                  value: 'Battery Health',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value;
                      boxColor = Colors.blueGrey[900]!;
                      buttonColor = Colors.blueGrey[900]!;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
