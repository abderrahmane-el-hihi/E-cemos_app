import 'package:cemos_app/SwitchPages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/button.dart';
import 'models/service.dart';

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
    //             fontFamily: 'Poppins',
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
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.14),

                  //email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(179, 179, 179, 1))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.green.shade400),
                          ),
                          fillColor: Colors.transparent,
                          filled: true,
                          label: const Text(
                            'E-mail',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  //password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      obscureText: isobsecure,
                      controller: passwcontroller,
                      decoration: InputDecoration(
                        label: const Text(
                          'mot de passe',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isobsecure = !isobsecure;
                            });
                          },
                          child: Icon(
                            isobsecure
                                ? Icons.visibility
                                : Icons.visibility_off_rounded,
                            color: isobsecure
                                ? Colors.green.shade400
                                : Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(179, 179, 179, 1))),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.green.shade400),
                        ),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(179, 179, 179, 1)),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  //signin buton
                  L_Button(
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
