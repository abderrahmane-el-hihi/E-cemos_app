import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromRGBO(131, 172, 64, 1),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: 'assets/Logo3.png',
        nextScreen: const LoginPage(),
      ),
    );
  }
}
