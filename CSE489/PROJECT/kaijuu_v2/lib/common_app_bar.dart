import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kaijuu_v2/leaderboard.dart';
import 'package:kaijuu_v2/progress_page.dart';
import 'package:kaijuu_v2/rewards_page.dart';
import 'homepage.dart';
// ignore: unused_import
import 'pomokaijuu.dart';
import 'tasks_page.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final Widget? body; // Making the body parameter optional

  const CommonAppBar({
    required this.title,
    Key? key,
    this.body, // Marking the body parameter as optional
  }) : super(key: key);

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.user, color: Colors.white),
              onPressed: () {
                // Will work on profile button press
              },
            ),
            Text(title), // Dynamic title
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.bars, color: Colors.white),
              onPressed: () {
                // Will work on more options button press
              },
            ),
          ],
        ),
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
      body: body, // Set the body content provided by the caller
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          height: 70,
          color: Colors.blueGrey[900],
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.house, color: Colors.white),
                  onPressed: () {
                    // Navigate to homepage.dart upon pressing the home button
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),  
                    );
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.feather, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProgressPage()),
                    );
                    // Will work on favorite button press
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  // ignore: deprecated_member_use
                  icon: const FaIcon(FontAwesomeIcons.tasks, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasksPage()),
                    );
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.medal, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RewardsPage()),
                    );
                    // Will work on rewards button press
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.trophy, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LeaderboardPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
