import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'login_page.dart';
class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => OtpPageState();
}

class OtpPageState extends State<OtpPage> {
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
                          hintText: "Enter One Time Password",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                    child: Text('Verify Account'),
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
