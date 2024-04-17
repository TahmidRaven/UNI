// registration_page.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kaijuu_v2/login_page.dart'; // Import the LoginPage

class RegistrationPage extends StatelessWidget {
  // Declare TextEditingController variables
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Register'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bars, color: Colors.white),
            onPressed: () {
              // Will work on more options button press
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: reEnterPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Re-enter Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform registration logic
                  // For demo purposes, just navigate to LoginPage after registration
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueGrey, backgroundColor: Colors.white,
                ),
                child: Text('Register'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Navigate back to the login page
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
