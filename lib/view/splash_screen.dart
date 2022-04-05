import 'dart:async';

import 'package:eduapps/view/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  goToNextPage() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    goToNextPage();
  }

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
