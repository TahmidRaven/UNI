import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 60,
          foregroundColor:const Color(0xFFFFFFFF),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text("I am the raven"),
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              // topLeft: Radius.circular(15),
              // topRight: Radius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],  
              ),
            ),
          ), systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
    ),
  );
}
