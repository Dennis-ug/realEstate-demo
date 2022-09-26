import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'login_page.dart';
import 'otp_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
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
                      height: 50,
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
                              Icons.arrow_right,
                              color: Colors.red,
                            ),
                          border: InputBorder.none,
                          hintText: "Enter Full name",
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
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.arrow_right,
                              color: Colors.red,
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
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.arrow_right,
                              color: Colors.red,
                            ),
                          border: InputBorder.none,
                          hintText: "Enter Contact",
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
                              Icons.arrow_right,
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
                              Icons.arrow_right,
                              color: Colors.red,
                            ),
                          border: InputBorder.none,
                          hintText: "Confirm Password",
                        ),
                      ),
                    ),
                    ElevatedButton(
                    onPressed: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //   builder: (context) => HomePage(),
                    // ),
                    // );
                    },
                    child: Text('Create Account'),
                    ),
                    TextButton(
                        onPressed: () {
                            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    );
                        },
                        child: Text("Click To Login"),
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
