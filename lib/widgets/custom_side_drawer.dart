import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mijo/provider/map_provider.dart';
import 'package:mijo/provider/user_provider.dart';
import 'package:mijo/screens/choice_screen.dart';
import 'package:mijo/screens/login_signup_screen.dart';
import 'package:mijo/screens/map_screen.dart';
import 'package:mijo/screens/profile.dart';
import 'package:mijo/screens/trips_screen.dart';
import 'package:provider/provider.dart';

import 'package:mijo/models/user_model.dart' as user;

class CustomSideDrawer extends StatelessWidget {
  const CustomSideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapProvider mapProvider = Provider.of<MapProvider>(
      context,
      listen: false,
    );
    final UserProvider userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    final user.User? loggedUser = userProvider.loggedUser;

    return Drawer(
      child: Column(
        children: [
          loggedUser != null
              ? UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  currentAccountPicture: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.black45,
                    ),
                  ),
                  accountName: Text(loggedUser.username!),
                  accountEmail: Text(loggedUser.email!),
                )
              : Container(
                  height: 200,
                  color: Theme.of(context).primaryColor,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
          const SizedBox(height: 10),          
          _buildButtonTile(
            context: context,
            title: 'Taxi',
            icon: Icons.car_crash,
            onTap: () => Navigator.of(context).pushNamed(
              MapScreen.route,
            ),
          ),
          _buildButtonTile(
            context: context,
            title: 'Services',
            icon: Icons.add_shopping_cart,
            onTap: () => Navigator.of(context).pushNamed(
              ChoiceScreen.route,
            ),
          ),
          _buildButtonTile(
            context: context,
            title: 'Trips',
            icon: Icons.navigation_rounded,
            onTap: () => Navigator.of(context).pushNamed(TripsScreen.route),
          ),
          _buildButtonTile(
            context: context,
            title: 'Profile',
            icon: Icons.account_box_rounded,
            onTap: () => Navigator.of(context).pushNamed(Profile.route),
          ),
          _buildButtonTile(
            context: context,
            title: 'Logout',
            icon: Icons.exit_to_app,
            onTap: () {
              mapProvider.stopListenToPositionStream();
              userProvider.clearUser();
              Navigator.of(context).pushNamedAndRemoveUntil(
                LoginSignupScreen.route,
                (Route<dynamic> route) => false,
              );
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButtonTile({
    BuildContext? context,
    String? title,
    IconData? icon,
    Function()? onTap,
  }) {
    return ListTile(
      title: Text(title!),
      leading: Icon(icon),
      onTap: () {
        Navigator.pop(context!);
        onTap!();
      },
    );
  }
}
