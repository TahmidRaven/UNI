import 'dart:async';
import 'package:flutter/material.dart';

class InputTextForm extends StatefulWidget {
  @override
  _InputTextFormState createState() => _InputTextFormState();
}

class _InputTextFormState extends State<InputTextForm> {
  TextEditingController _textController = TextEditingController();
  StreamController<String> _textStreamController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _textController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Enter text',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String inputText = _textController.text;
              _textStreamController.sink.add(inputText); // Broadcast the text
            },
            child: Text('Broadcast'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey[900]!),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _textStreamController.close(); // Close the stream when not needed
    super.dispose();
  }
}
