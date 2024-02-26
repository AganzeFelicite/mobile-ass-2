import 'package:flutter/material.dart';
import 'package:helloworld/components/button.dart';
import 'package:helloworld/components/input.dart';
import 'package:helloworld/components/square_tile.dart';
import 'package:helloworld/main.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isDarkMode = false;

  void userLogin(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return RootPage(
          onThemeChanged: (bool isDarkMode) {
            setState(() {
              this.isDarkMode = isDarkMode;
            });
          },
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Icon(
              Icons.lock,
              size: 100,
              color: Colors.grey.shade900,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Welcome Back',
              style: TextStyle(fontSize: 20.0, color: Colors.grey.shade700),
            ),
            const SizedBox(
              height: 50,
            ),
            Inputs(
              controller: userNameController,
              obscureText: false,
              hintText: 'Username',
            ),
            const SizedBox(
              height: 20,
            ),
            Inputs(
              controller: passwordController,
              obscureText: true,
              hintText: 'Password',
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyBtn(
              btnTxt: 'Login',
              onTap: () => userLogin(context),
            ),
            const SizedBox(
              height: 10,
            ),
            MyBtn(
              btnTxt: 'Sign Up',
              onTap: () => userLogin(context),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Text('  or Continue with  ',
                    style: TextStyle(color: Colors.grey[500])),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SquareTile(
              imagePath:
                  "https://clipground.com/images/google-logo-clipart-transparent.png",
            )
          ],
        ),
      ),
    );
  }
}
