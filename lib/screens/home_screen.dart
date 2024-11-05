import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../appbar_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('FLOW'),
          appBar: AppBar(),
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.white,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: kcolor1,

        //   child: Icon(
        //     Icons.add_comment_rounded,
        //   ),

        // ),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.add_comment_rounded,
              size: 30,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [kcolor1, kcolor2],
                )),
          ),
          onPressed: () async {
            //sign out function

            await FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut();
          },
        ));
  }
}
