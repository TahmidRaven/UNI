import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'homepage.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Task> tasks = [
    Task(title: 'Task 1', isDone: false),
    Task(title: 'Task 2', isDone: false),
    Task(title: 'Task 3', isDone: false),
    // Add more tasks as needed
  ];

  void addTask(String newTaskTitle) {
    setState(() {
      tasks.add(Task(title: newTaskTitle, isDone: false));
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

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
              icon: FaIcon(FontAwesomeIcons.user, color: Colors.white),
              onPressed: () {
                // Will work on profile button press
              },
            ),
            Text("Tasks"),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.bars, color: Colors.white),
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
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(tasks[index].title),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              removeTask(index);
            },
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: ListTile(
              title: Text(
                tasks[index].title,
                style: TextStyle(
                  color: tasks[index].isDone ? Colors.grey : Colors.white,
                  decoration: tasks[index].isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              onTap: () {
                toggleTask(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String? newTaskTitle = await showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              String taskName = '';
              return AlertDialog(
                title: Text('Add New Task'),
                content: TextField(
                  onChanged: (value) {
                    taskName = value;
                  },
                  decoration: InputDecoration(hintText: 'Enter task name'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      addTask(taskName);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.feather, color: Colors.white),
                  onPressed: () {
                    // Will work on favorite button press
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.barsProgress, color: Colors.white),
                  onPressed: () {
                    // Will work on tasks button press
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

class Task {
  String title;
  bool isDone;

  Task({required this.title, required this.isDone});
}
   