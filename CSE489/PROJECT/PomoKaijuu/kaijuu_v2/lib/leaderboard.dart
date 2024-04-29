import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'common_app_bar.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _allUsers = [];
  List<DocumentSnapshot> _filteredUsers = [];

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      title: 'Leaderboard',
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0), // Increased padding to move down the leaderboard
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearchBar(),
              SizedBox(height: 10), // Space above the table
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('users').orderBy('points', descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  _allUsers = snapshot.data!.docs;
                  if (_searchController.text.isNotEmpty && _filteredUsers.isEmpty) {
                    return Center(child: Text('No matching users'));
                  }
                  return SingleChildScrollView(
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
                        rows: _filteredUsers.asMap().entries.map((entry) {
                          final index = entry.key;
                          final userData = entry.value.data() as Map<String, dynamic>;
                          final username = userData['username'];
                          final points = userData['points'];
                          final isTopScorer = index == 0;
                          final isOddRow = index % 2 != 0;
                          return DataRow(
                            color: isOddRow ? MaterialStateProperty.all(Colors.grey.withOpacity(0.1)) : MaterialStateProperty.all(Colors.transparent),
                            cells: [
                              DataCell(Text((index + 1).toString(), style: TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Row(
                                children: [
                                  Text(username, style: TextStyle(fontWeight: FontWeight.bold)),

                                  if (isTopScorer) Icon(Icons.emoji_events, color: Colors.yellow), // Trophy icon for the top scorer
                                ],
                              )),
                              DataCell(Text(points.toString(), style: TextStyle(fontWeight: FontWeight.bold))),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Focus the text field only when tapped explicitly
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: 'Search by username',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
          onChanged: _filterUsers,
        ),
      ),
    );
  }

  void _filterUsers(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _filteredUsers = _allUsers.where((user) => user['username'].toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        _filteredUsers = _allUsers;
      }
    });
  }
}
