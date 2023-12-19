// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mijo/firebase_options.dart';
import 'package:mijo/pages/start_page.dart';
import 'package:mijo/provider/map_provider.dart';
import 'package:mijo/provider/user_provider.dart';
import 'package:mijo/screens/choice_screen.dart';
import 'package:mijo/screens/login_signup_screen.dart';
import 'package:mijo/screens/map_screen.dart';
import 'package:mijo/screens/onboarding_screen.dart';
import 'package:mijo/screens/profile.dart';
import 'package:mijo/screens/service_screen.dart';
import 'package:mijo/screens/trips_screen.dart';
import 'package:mijo/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TaxiApp());
}

class TaxiApp extends StatelessWidget {
  const TaxiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: MapProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Taxi App',
        theme: theme,
        initialRoute: OnboardingScreen.route,
        routes: {
          OnboardingScreen.route: (_) => const OnboardingScreen(),
          MapScreen.route: (_) => const MapScreen(),
          LoginSignupScreen.route: (_) => const LoginSignupScreen(),
          TripsScreen.route: (_) => const TripsScreen(),
          ChoiceScreen.route: (_) => const ChoiceScreen(),
          Profile.route: (_) => const Profile(),
        },
      ),
    );
  }
}