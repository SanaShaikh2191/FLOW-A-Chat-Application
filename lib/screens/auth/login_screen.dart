import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/helper/dialogs.dart';
import 'package:flow/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  _handleGoogleBtnClick() {
    // for showing progress bar
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) {
      // for hiding progress bar
      Navigator.pop(context);

      if (user != null) {
        log('/nUser : ${user.user}');
        log('/nUserAdditionalInfo : ${user.additionalUserInfo}');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log('/n_signInWithGoogle : $e');
      Dialogs.showSnacbar(context, 'Something Went Wrong (Check Internet!)');
      return null;
    }
  }
  

  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: mq.height * .25,
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            width: mq.width * .5,
            child: Image.asset('images/discussion.png')),
        Positioned(
          bottom: mq.height * .15,
          left: mq.width * .05,
          width: mq.width * .9,
          height: mq.height * .06,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffffcbfb),
                shape: StadiumBorder(),
                elevation: 1),
            onPressed: () {
              _handleGoogleBtnClick();
            },
            icon: Image.asset(
              'images/search.png',
              height: 30,
              width: 30,
            ),
            label: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(text: 'Login with'),
                    TextSpan(
                        text: ' Google',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
