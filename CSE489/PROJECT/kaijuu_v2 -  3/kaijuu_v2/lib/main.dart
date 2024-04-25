import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';  
import 'package:kaijuu_v2/login_page.dart';
import 'package:kaijuu_v2/tasks_page.dart';
import 'homepage.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
        theme: ThemeData(  
          scaffoldBackgroundColor: Colors.blueGrey,
        ),
        initialRoute: '/', // Set initial route to '/'
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => LoginPage()); // Return LoginPage for the initial route
            case '/home':
              return MaterialPageRoute(builder: (context) => HomePage()); // Return HomePage for '/home' route
            case '/tasks':
              return MaterialPageRoute(builder: (context) => TasksPage()); // Return TasksPage for '/tasks' route
            default:
              return MaterialPageRoute(builder: (context) => LoginPage()); // Return LoginPage for unknown routes
          }
        },
      ),
    );
  }
}
