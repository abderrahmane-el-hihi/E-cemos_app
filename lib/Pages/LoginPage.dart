import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/TextFieldClass.dart';
import '../components/button.dart';
import '../services/service.dart';
import 'SwitchPages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwcontroller = TextEditingController();

  void LogIn() async {
    String? validation = await RemoteService()
        .checkCredentials(emailcontroller.text, passwcontroller.text);
    // if (validation == '?') {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => SwitchPages()));
    // } else {
    //   showCupertinoDialog(
    //     context: context,
    //     builder: (context) {
    //       return CupertinoAlertDialog(
    //         content: Text(
    //           'Les Données entrées sont invalides',
    //           style: TextStyle(
    //
    //           ),
    //         ),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               emailcontroller.clear();
    //               passwcontroller.clear();
    //               Navigator.pop(context);
    //             },
    //             child: Text('D\'accord'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SwitchPages()));
  }

  bool isobsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  Image.asset('assets/Logo3.png', scale: 4),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Bienvenue dans Libre RH',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.14),

                  //email textfield
                  TextFieldClass(
                      controller: emailcontroller,
                      obscureText: false,
                      title: 'E-mail'),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  //password textfield
                  TextFieldClass(
                      maxLines: 1,
                      suffIcon: Icons.visibility,
                      suffIcon2: Icons.visibility_off_rounded,
                      controller: passwcontroller,
                      obscureText: isobsecure,
                      title: 'mot de passe'),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  //signin buton
                  L_Button(
                    paddsize: 25,
                    onTap: LogIn,
                    text: 'Se connecter',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
