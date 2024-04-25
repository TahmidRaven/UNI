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
          RewardItem(title: 'Complete 20 Tasks (Daily)', points: 250),
          RewardItem(title: 'Focus 50 Minutes (Daily)', points: 500),
           

          SizedBox(height: 20.0),
           
          Text(
            'Weekly Rewards',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          RewardItem(title: 'Complete 200 Tasks (Weekly)', points: 2500),
          RewardItem(title: 'Complete 100 Sessions (Weekly)', points: 3000),
          RewardItem(title: 'Streak for 7 days (Weekly)', points: 1000),

          
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
         
        onTap: () {
           
          print('Reward tapped: $title');
        },
      ),
    );
  }
}
