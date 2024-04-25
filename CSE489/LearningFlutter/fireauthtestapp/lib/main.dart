import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fireauthtestapp/login_screen.dart';
import 'package:fireauthtestapp/sign_up_screen.dart';
 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => SignUpScreen());
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          default:
            return null;
        }
      },
    );
  }
}
