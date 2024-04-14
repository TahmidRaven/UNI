// main.dart
import 'package:flutter/material.dart';
import 'package:kaijuu_v2/tasks_page.dart';
import 'homepage.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        theme: ThemeData( // Set the theme to apply blueGrey background
          scaffoldBackgroundColor: Colors.blueGrey,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => HomePage());
            case '/tasks':
              return MaterialPageRoute(builder: (context) => TasksPage());
            default:
              return MaterialPageRoute(builder: (context) => HomePage());
          }
        },
      ),
    );
  }
}
