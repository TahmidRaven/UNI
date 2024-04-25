import 'package:flutter/material.dart';

class MyRewardsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Rewards',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          // Display daily rewards
          Text(
            'Daily Rewards',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          RewardItem(title: 'Complete 2 Tasks (Daily)', points: 25),
          RewardItem(title: 'Focus 50 Minutes (Daily)', points: 50),
          // Add more daily rewards here if needed

          SizedBox(height: 20.0),
          // Display weekly rewards
          Text(
            'Weekly Rewards',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          RewardItem(title: 'Complete 20 Tasks (Weekly)', points: 250),
          RewardItem(title: 'Complete 10 Sessions (Weekly)', points: 300),
          RewardItem(title: 'Streak for 7 days (Weekly)', points: 100),

          // Add more weekly rewards here if needed
        ],
      ),
    );
  }
}

class RewardItem extends StatelessWidget {
  final String title;
  final int points;

  const RewardItem({
    required this.title,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        title: Text(title),
        subtitle: Text('Points: $points'),
        leading: Icon(Icons.star),
        // Add functionality or customize the appearance of each reward item
        // based on your requirements
        onTap: () {
          // Implement what should happen when the reward item is tapped
          // For example, show more details or perform an action
          print('Reward tapped: $title');
        },
      ),
    );
  }
}
