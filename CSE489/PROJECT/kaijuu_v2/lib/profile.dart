import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'common_app_bar.dart';

class ProfilePage extends StatefulWidget {
  final String userId;

  ProfilePage({required this.userId});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      title: 'Profile',
      body: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('users').doc(widget.userId).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text('User not found'));
            }

            // Extract user data
            Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
            String username = userData['username'];
            String email = userData['email'];

            // Set initial values for text fields
            _usernameController.text = username;
            _emailController.text = email;

            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),  
                  Text(
                    'Username:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),  
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20), 
                  Text(
                    'Email:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),  
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),  
                  ElevatedButton(
                    onPressed: () {
                      _updateUserData();
                    },
                    child: Text('Save Changes'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _updateUserData() {
    String newUsername = _usernameController.text;
    String newEmail = _emailController.text;

    // Update user data in Firestore
    FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
      'username': newUsername,
      'email': newEmail,
    }).then((_) {
      // Show success message or navigate to another page
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated successfully')));
    }).catchError((error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update profile: $error')));
    });
  }
}
