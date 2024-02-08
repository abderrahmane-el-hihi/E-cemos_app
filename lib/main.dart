import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Pages/LoginPage.dart';
import 'components/button.dart';
import 'models/Personnel.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://dnllwebartynjflqirwd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRubGx3ZWJhcnR5bmpmbHFpcndkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc0MTMyNDcsImV4cCI6MjAyMjk4OTI0N30.b2okY3RShpEsI7dyADLLpElnASOeodLBe6ZRVxOvXGc',
  );
  initializeDateFormatting().then(
    (_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ButtonStateModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => personnelDataProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
  // runApp(const MyApp());
}

final supabase = Supabase.instance.client;

Future<void> loadFont() async {
  await rootBundle.load('assets/fonts/Poppins-Medium.ttf');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        // colorSchemeSeed: Color.fromRGBO(131, 172, 64, 1),
        colorSchemeSeed: Colors.green.shade400,
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 128,
        splash: 'assets/Logo3.png',
        nextScreen: const LoginPage(),
      ),
      // home: twidget(),
      // home: MyFormPage(),
    );
  }
}
