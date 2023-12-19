// ignore_for_file: unused_field, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:mijo/pages/home.dart';
import 'package:mijo/screens/profile.dart';
import 'package:mijo/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../screens/map_screen.dart';
import 'form_button.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthServices _auth = AuthServices();
  late AnimationController _animationController;
  late Animation<double> _sizetransition;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _authenticate(BuildContext context) async {
    try {
      await _googleSignIn.signIn();
      // After successful sign-in, you can retrieve the user's data using
      // _googleSignIn.currentUser
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              Profile(), // Replace Profile() with your actual profile screen widget
        ),
      );
    } catch (error) {
      print("Error during Google sign-in: $error");
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _sizetransition = CurvedAnimation(
      curve: Curves.easeIn,
      parent: _animationController,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Other input fields can be added here, based on the updated requirements
          IntlPhoneField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          const SizedBox(height: 10),
          FormButton(
            title: 'Login',
            handler: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      Profile(), // Replace Profile() with your actual profile screen widget
                ),
              );
            },
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(
            height: 40,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 120,
                child: Divider(
                  color: Colors.grey, // Set the color of the divider
                  thickness: 1, // Set the thickness of the divider
                  height:
                      20, // Set the height of the divider (vertical space around the divider)
                  indent: 20, // Set the left indent of the divider
                  endIndent: 20, // Set the right indent of the divider
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text('OR'),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 120,
                child: Divider(
                  color: Colors.grey, // Set the color of the divider
                  thickness: 1, // Set the thickness of the divider
                  height:
                      20, // Set the height of the divider (vertical space around the divider)
                  indent: 20, // Set the left indent of the divider
                  endIndent: 20, // Set the right indent of the divider
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 40,
          ),

          TextButton(
            onPressed: () async {
              // await _authenticate(context);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
              backgroundColor: Color.fromARGB(255, 235, 232, 232),
              primary: Color.fromARGB(255, 48, 47, 47),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/google_logo.png', width: 30, height: 30),
                const SizedBox(
                  width: 20,
                ),
                Text("Sign in with Google"),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
