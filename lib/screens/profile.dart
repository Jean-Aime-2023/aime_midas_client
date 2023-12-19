// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mijo/provider/user_provider.dart';
import 'package:mijo/screens/UpdateProfileScreen.dart';
import 'package:mijo/widgets/custom_side_drawer.dart';
import 'package:mijo/models/user_model.dart' as user;
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const String route = '/profile';

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );

    final user.User? loggedUser = userProvider.loggedUser;

    return Scaffold(
      appBar: AppBar(
        title: const DefaultTextStyle(
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontStyle: FontStyle.normal),
          child: Text("Profile"),
        ),
      ),
      drawer: const CustomSideDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(400),
                    child: Container(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                            'images/avatar.jpeg'), // Use loggedUser's image
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors
                          .blue, // Set the background color for the container
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.edit),
                  ),
                )
              ]),
              const SizedBox(height: 30),

              // Text(
              //   'Username:',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Column(
                children: [
                  Text(
                    loggedUser?.username ?? "John Doe",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    loggedUser?.email ?? 'johndoe@example.com',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Text(
                  //   'UserType:',
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Text(
                    loggedUser?.userType ?? 'No UserType',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Text(
              //   'Email:',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),

              const SizedBox(height: 20),
            

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProfileScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 66, 54, 245),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Edit profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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
