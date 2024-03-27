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
      appBar: AppBar(
        title: const Text('Match Results'),
      ),
      body: ListView.builder(
        itemCount: usersListModel.matches.length,
        itemBuilder: (context, index) {
          final match = usersListModel.matches[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tournament: ${match.tournament}'),
                Text('Date: ${match.date}'),
                Text('Player 1: ${match.player1}'),
                Text('Player 2: ${match.player2}'),
                Text('Score: ${match.score}'),
                Text('Winner: ${match.winner}'),
              ],
            ),
            onTap: () {
              // Handle tap on match item if needed
            },
          );
        },
      ),
    );
  }
}
