import 'package:cemos_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'components/button.dart';
import 'package:cemos_app/components/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwcontroller = TextEditingController();
  void LogIn() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/Logo3.png', scale: 3),
                  SizedBox(height: 10),
                  Text(
                    'Bienvenue',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 50),

                  //email textfield
                  Text_Field(
                    controller: emailcontroller,
                    hinText: 'E-mail Address',
                    obsecureText: false,
                    preicon: Icons.email_rounded,
                  ),

                  SizedBox(height: 10),
                  //password textfield
                  Text_Field(
                    controller: passwcontroller,
                    hinText: 'Password',
                    obsecureText: true,
                    preicon: Icons.lock,
                  ),
                  SizedBox(height: 10),
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
