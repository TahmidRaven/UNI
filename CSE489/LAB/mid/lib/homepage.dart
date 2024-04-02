// disclaimer: I've tried to implement my boilerplate for the UI which uses 
// different font family and a nav and bottom bar for future modifications 

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mid/show_results_page.dart';

class HomePage extends StatelessWidget {
  Future<void> _fetchMatchResults(BuildContext context) async {
    final response = await http.get(Uri.parse('https://mocki.io/v1/59d20a17-1704-466f-9fd7-0bddd88836a4'));
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShowResultsPage(responseBody: response.body)),
      );
    } else {
      throw Exception('Failed to load match results');
    }
  }

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
        title: const Text("Homepage"),
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
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Will work on search button press
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Will work on more options button press
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => _fetchMatchResults(context),
          child: const Text('GET RESULT'),
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
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Will work on notifications button press
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Will work on profile button press
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
