import 'package:eduapps/view/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LoginPage();
          }));
        },
        child: Center(
          child: Image.asset(
            "assets/auth/ic_splash.png",
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ),
      backgroundColor: Color(0xff3A7FD5),
    );
  }
}
