import 'package:flutter/material.dart';
import 'package:mijo/provider/user_provider.dart';
import 'package:mijo/models/user_model.dart' as user;
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);
  static const String route = '/update-profile';

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );

    final user.User? loggedUser = userProvider.loggedUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/avatar.jpeg'), // Use loggedUser's image
              ),
              SizedBox(height: 8),
              TextFormField(
                initialValue: loggedUser?.username ?? 'John Doe', // Show loggedUser's username
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 8),
              TextFormField(
                initialValue: loggedUser?.email ?? 'johndoe@example.com', // Show loggedUser's email
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 8),
              TextFormField(
                initialValue: loggedUser?.userType ?? 'No UserType', // Show loggedUser's userType
                decoration: InputDecoration(labelText: 'UserType'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add logic to update user data
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 66, 54, 245),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}
