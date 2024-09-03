import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pathika/auth/login_page.dart';
import 'package:pathika/auth/sign_up.dart';
import 'package:pathika/pages/home_page.dart';
import 'package:pathika/pages/profile.dart';
import 'package:pathika/pages/settings.dart';
import 'package:pathika/pages/splash_screen.dart';

import 'components/tab_bar.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: FirstPage(),
      routes: {
        '/nav': (context) => BottomNav(),
        '/homepage': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/setting': (context) => Settings(),
        '/login': (context) => LoginPage(),
        '/sign': (context) => SignUpPage(),
      },
    );
  }
}
