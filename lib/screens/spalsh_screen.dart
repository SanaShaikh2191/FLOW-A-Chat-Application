import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/auth/login_screen.dart';
import 'package:flow/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      if (FirebaseAuth.instance.currentUser != null) {
        log('/nUser : ${FirebaseAuth.instance.currentUser}');
        
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: mq.height * .25,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset('images/discussion.png')),
        Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: Text(
              'MADE BY SANA SHAIKH',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, color: Colors.black87, letterSpacing: .5),
            ))
      ]),
    );
  }
}
