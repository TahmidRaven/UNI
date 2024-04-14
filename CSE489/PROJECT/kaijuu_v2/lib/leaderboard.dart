import 'package:flutter/material.dart';
import 'common_app_bar.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  List<User> _users = [
    User(name: 'Luffy', score: 500),
    User(name: 'Ace', score: 450),
    User(name: 'Sabo', score: 400),
    User(name: 'Zorro', score: 350),
    User(name: 'Law', score: 300),
    User(name: 'Corazon', score: 250),
    User(name: 'Doffy', score: 200),
    User(name: 'Robin', score: 450),
    User(name: 'Franky', score: 420),
    User(name: 'Brook', score: 380),
    User(name: 'Nami', score: 340),
    User(name: 'Chopper', score: 310),
    User(name: 'Jinbei', score: 290),
    User(name: 'Sanji', score: 240),
    User(name: 'Usopp', score: 210),
    User(name: 'Kinemon', score: 180),
    User(name: 'Kanjuro', score: 170),
    User(name: 'Kaido', score: 550),
    User(name: 'Big Mom', score: 530),
    User(name: 'Shanks', score: 520),
    User(name: 'Blackbeard', score: 490),
    User(name: 'Whitebeard', score: 470),
    User(name: 'Roger', score: 460),
    User(name: 'Katakuri', score: 440),
    User(name: 'Smoothie', score: 430),
  ];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      title: 'Leaderboard',
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 10), // Space above the table
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: DataTable(
                  headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  columnSpacing: MediaQuery.of(context).size.width / 5,
                  columns: [
                    DataColumn(label: Text('Rank')),
                    DataColumn(label: Text('User')),
                    DataColumn(label: Text('Score')),
                  ],
                  rows: _users.asMap().entries.map((entry) {
                    final index = entry.key;
                    final user = entry.value;
                    final isTopScorer = index == 0;
                    final isOddRow = index % 2 != 0;
                    return DataRow(
                      color: isOddRow ? MaterialStateProperty.all(Colors.grey.withOpacity(0.1)) : MaterialStateProperty.all(Colors.transparent),
                      cells: [
                        DataCell(Text((index + 1).toString(), style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Row(
                          children: [
                            Text(user.name, style: TextStyle(fontWeight: FontWeight.bold)),

                            if (isTopScorer) Icon(Icons.emoji_events, color: Colors.yellow), // Trophy icon for the top scorer
                          ],
                        )),
                        DataCell(Text(user.score.toString(), style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Search by username',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: _filterUsers,
      ),
    );
  }

  void _filterUsers(String query) {
    setState(() {
      _users = _users.where((user) => user.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }
}

class User {
  final String name;
  final int score;

  User({required this.name, required this.score});
}
