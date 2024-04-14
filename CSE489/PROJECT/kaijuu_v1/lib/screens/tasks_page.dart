import 'package:flutter/material.dart';
import 'package:kaijuu_v1/widgets/custom_app_bar.dart';
import 'package:kaijuu_v1/widgets/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Tasks",
        onProfilePressed: () {
          // Handle profile button press
        },
        onMenuPressed: () {
          // Handle menu button press
        },
      ),
      body: ListView.builder(
        itemCount: 0, // Replace with your actual item count
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Task $index"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle floating action button press
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [],  
        currentIndex: 0, 
        onTap: (index) {
          // Handle tap on bottom navigation item
        },
      ),
    );
  }
}
