import 'package:cemos_app/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'components/button.dart';
import 'models/Personnel.dart';

void main() {
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
    );
  }
}
