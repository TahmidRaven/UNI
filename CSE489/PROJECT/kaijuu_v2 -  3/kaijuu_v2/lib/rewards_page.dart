import 'package:flutter/material.dart';
import 'common_app_bar.dart';
import 'my_rewards_widget.dart';
 

class RewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      title: 'Rewards',
      body: MyRewardsWidget(), // Use MyRewardsWidget here
    );
  }
}
