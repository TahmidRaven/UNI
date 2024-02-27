import 'package:flutter/material.dart';
import 'broadcast.dart';

class InputTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, 
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 60,
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: Colors.transparent,
        elevation: 4.0,
        title: Text('Input Text'),
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
      body: InputTextForm(),
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
}

class InputTextForm extends StatefulWidget {
  @override
  _InputTextFormState createState() => _InputTextFormState();
}

class _InputTextFormState extends State<InputTextForm> {
  TextEditingController _textController = TextEditingController();

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BroadcastPage(inputText: inputText),
                ),
              );
            },
            child: Text('Broadcast'),  
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey[900]!),  
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
