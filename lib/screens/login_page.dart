import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:real_estate_mania_yt/screens/home_page.dart';
import 'signup_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        // your conditions to render the widgets!
        if (_currentIndex == 0) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                           prefixIcon: Icon(
                          Icons.contact_mail_outlined,
                          color: Colors.blue,
                            ),
                          border: InputBorder.none,
                          hintText: "Enter Email Address",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.red,
                            ),
                          border: InputBorder.none,
                          hintText: "Enter Password",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                    onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                    );
                    },
                    child: Text('Click To Login'),
                    ),
                    TextButton(
                        onPressed: () {
                           Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                    );
                        },
                        child: Text("Create A New Account"),
                        ),
                  ],
                ),
              ),
            ),
          );
        }
        // this will not be the case but for null safety we are using this
        return const SizedBox();
      }),
    );
  }
}
