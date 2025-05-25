import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media/auth/auth.dart';
import 'package:mini_social_media/pages/home_page.dart';
import 'package:mini_social_media/pages/profile_page.dart';
import 'package:mini_social_media/pages/users_page.dart';
import 'package:mini_social_media/theme/dark_mode.dart';
import 'package:mini_social_media/theme/light_mode.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page' : (context) => const AuthPage(),
        '/home_page' : (context) =>  HomePage(),
        '/profile_page' : (context) =>  ProfilePage(),
        '/users_page' : (context) => const UsersPage(),
      },

    );
  }
}
