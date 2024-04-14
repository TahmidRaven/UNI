import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kaijuu_v1/widgets/custom_app_bar.dart';
import 'package:kaijuu_v1/widgets/custom_bottom_navigation_bar.dart';
 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Homepage',
        onProfilePressed: () {
          // Handle profile button press
        },
        onMenuPressed: () {
          // Handle menu button press
        },
      ),
      body: const Center(
        child: Text('Home Page Content'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.feather),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.barsProgress),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidBell),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.medal),
            label: 'Leaderboard',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle bottom navigation bar item tap
        },
      ),
    );
  }
}
