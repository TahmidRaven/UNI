import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pomokaijuu.dart';
import 'tasks.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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
            const Text("Homepage"),
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
      body: Stack(
        children: [
          Center(
            child: PomoKaijuu(),
          ),
        ],
      ),
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
                      MaterialPageRoute(builder: (context) => const HomePage()),  
                    );
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.feather, color: Colors.white),
                  onPressed: () {
                    // Will work on favorite button press
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.barsProgress,
                      color: Colors.white),
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
                  icon: FaIcon(FontAwesomeIcons.solidBell, color: Colors.white),
                  onPressed: () {
                    // Will work on rewards button press
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.medal, color: Colors.white),
                  onPressed: () {
                    // Will work on leaderboard button press
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
