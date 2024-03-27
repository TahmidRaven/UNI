import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mid/users_list_model.dart';

class TennisMatchViewModel extends ChangeNotifier {
  List<Match>? matches;

  Future<void> fetchMatchResults() async {
    final response = await http.get(Uri.parse('https://mocki.io/v1/59d20a17-1704-466f-9fd7-0bddd88836a4'));
    if (response.statusCode == 200) {
      final usersListModel = UsersListModel.fromJson(json.decode(response.body));
      matches = usersListModel.matches;
      notifyListeners();
    } else {
      throw Exception('Failed to load match results');
    }
  }
}
