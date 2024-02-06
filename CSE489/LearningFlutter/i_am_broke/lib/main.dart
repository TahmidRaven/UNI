import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(home: Center(child: Text('Hello'))));

// the main fun is the starting point of all our flutter apps.
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text(
            "I'm_Broke",
            style: TextStyle(color: Colors.white), 
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
            
          child: Image(
            image: NetworkImage('https://i1.wp.com/bdn-data.s3.amazonaws.com/uploads/2019/12/32266281_H25797261.JPG?fit=1200%2C675&ssl=1'),
          ),
        ),
      ),
    ),
  );
}
