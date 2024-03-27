import 'dart:convert';

class UsersListModel {
  List<Match> matches;

  UsersListModel({
    required this.matches,
  });

  factory UsersListModel.fromJson(Map<String, dynamic> json) => UsersListModel(
        matches:
            List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
      };
}

class Match {
  String tournament;
  DateTime date;
  String player1;
  String player2;
  String score;
  String winner;

  Match({
    required this.tournament,
    required this.date,
    required this.player1,
    required this.player2,
    required this.score,
    required this.winner,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        tournament: json["tournament"],
        date: DateTime.parse(json["date"]),
        player1: json["player1"],
        player2: json["player2"],
        score: json["score"],
        winner: json["winner"],
      );

  Map<String, dynamic> toJson() => {
        "tournament": tournament,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "player1": player1,
        "player2": player2,
        "score": score,
        "winner": winner,
      };
}



// i've here used https://app.quicktype.io/ to to parse the json
// not sure if there were any restrictions or not; however all the youtubers seem to use it