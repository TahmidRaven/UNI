import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _taskController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _addTask(String task) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid; // Get current user's ID
      // Get a reference to the tasks subcollection
      CollectionReference tasksCollectionRef = _firestore.collection('users').doc(userId).collection('tasks');

      // Add a new document to the tasks subcollection
      await tasksCollectionRef.add({
        'task': task,
        'timestamp': Timestamp.now(),
      });
      _taskController.clear();
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: 'Enter task...',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_taskController.text.isNotEmpty) {
                _addTask(_taskController.text);
              }
            },
            child: Text('Add Task'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _firestore.collection('users').doc(_auth.currentUser?.uid).collection('tasks').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var tasks = snapshot.data?.docs;
                List<Widget> taskWidgets = [];
                for (var task in tasks!) {
                  var taskData = task.data();
                  var taskText = taskData['task'];
                  var taskWidget = ListTile(
                    title: Text(taskText),
                  );
                  taskWidgets.add(taskWidget);
                }
                return ListView(
                  children: taskWidgets,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
