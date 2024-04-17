import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';
import 'common_app_bar.dart';
import 'package:getwidget/getwidget.dart';

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
              double progress = counterProvider.progressValues[index] * 100;

              return ListTile(
                title: Text(counterProvider.tasks[index]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        GFProgressBar(
                          percentage: counterProvider.progressValues[index],
                          backgroundColor: Colors.white38,
                          progressBarColor: Colors.white,
                          lineHeight: 20, // Adjust the height here
                        ),
                        Positioned.fill(
                          child: Center(
                            child: Text(
                              '${progress.toStringAsFixed(0)}%',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Slider(
                      value: counterProvider.progressValues[index],
                      min: 0.0,
                      max: 1.0,
                      onChanged: (newValue) {
                        counterProvider.setProgressValue(index, newValue);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
