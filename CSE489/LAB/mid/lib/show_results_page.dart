import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mid/users_list_model.dart';

class ShowResultsPage extends StatelessWidget {
  final String responseBody;

  const ShowResultsPage({super.key, required this.responseBody});

  @override
  Widget build(BuildContext context) {
    final usersListModel = UsersListModel.fromJson(json.decode(responseBody));

    return Scaffold(
      backgroundColor: Colors.blueGrey, // Set background color
      appBar: AppBar(
        toolbarHeight: 60,
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: Colors.transparent,
        elevation: 4.0,
        title: const Text('Match Results'),
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
      body: ListView.builder(
        itemCount: usersListModel.matches.length,
        itemBuilder: (context, index) {
          final match = usersListModel.matches[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tournament: ${match.tournament}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Date: ${match.date}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Player 1: ${match.player1}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Player 2: ${match.player2}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Score: ${match.score}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Winner: ${match.winner}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            onTap: () {
               
            },
          );
        },
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
