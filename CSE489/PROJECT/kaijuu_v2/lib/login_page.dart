// login_page.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kaijuu_v2/homepage.dart'; // Import the HomePage
import 'package:kaijuu_v2/registration_page.dart'; // Import the RegistrationPage

class LoginPage extends StatelessWidget {
  // Declare TextEditingController variables
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Login'),
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
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Retrieve text field values
                  String enteredEmail = emailController.text;
                  String enteredPassword = passwordController.text;

                  // Simulate login process with hardcoded credentials
                  String hardcodedEmail = 'root@email.com'; // Hardcoded email
                  String hardcodedPassword = 'root'; // Hardcoded password

                  // Check if entered credentials match the hardcoded credentials
                  if (enteredEmail == hardcodedEmail && enteredPassword == hardcodedPassword) {
                    // Navigate to the home page upon successful login
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    // Show error message or handle invalid credentials
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Invalid Credentials'),
                          content: Text('Please enter valid email and password.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueGrey, backgroundColor: Colors.white,
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Navigate to the registration page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
