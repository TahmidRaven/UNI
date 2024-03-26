import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart'; // Import homepage.dart

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Space Grotesk'),
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Use HomePage as the home screen
    ),
  );
}
