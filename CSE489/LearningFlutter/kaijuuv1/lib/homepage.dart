import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
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
        title: const Text("I am the raven g"),
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
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        )
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search button pressed");
              // Implement search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              print("More options button pressed");
              // Implement more options functionality here
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Your homepage content goes here",
          style: TextStyle(color: Colors.white),
        ),
      ),
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
                print("Home button pressed");
                // Implement home functionality here
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                print("Favorite button pressed");
                // Implement favorite functionality here
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print("Settings button pressed");
                // Implement settings functionality here
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
