import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';
import 'common_app_bar.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      title: 'Progress',
      body: Consumer<CounterProvider>(
        builder: (context, counterProvider, _) {
          return ListView.builder(
            itemCount: counterProvider.tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(counterProvider.tasks[index]),
                subtitle: LinearProgressIndicator(
                  value: 0.5, // Replace with actual completion percentage
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
