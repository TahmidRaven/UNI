import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';
import 'common_app_bar.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      title: "Tasks",
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: TaskList(),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, _) {
        if (counterProvider.tasks == null) {
          counterProvider.initTasks(); // Example method to initialize tasks
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: counterProvider.tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(counterProvider.tasks[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            setState(() {
                              counterProvider.completeTask(index); // Use completeTask method
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              counterProvider.removeTask(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Enter a new task',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        String task = _textEditingController.text;
                        if (task.isNotEmpty) {
                          counterProvider.addTask(task);
                          _textEditingController.clear();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
