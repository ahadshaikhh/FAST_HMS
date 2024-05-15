import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class tokenscreen extends StatefulWidget {
  tokenscreen({Key? key, required this.token_no}):super(key: key);
  int token_no;
  @override
  State<tokenscreen> createState() => _tokenscreenState();
}

class _tokenscreenState extends State<tokenscreen> {
  var randnum = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: GNav(
          tabBorderRadius: 400,
          tabBackgroundColor: Color.fromARGB(255, 35, 37, 64),
          color: Colors.white,
          activeColor: Colors.white,
          hoverColor: Color.fromARGB(255, 35, 37, 64),
          backgroundColor: Color(0xFF0A0E21),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return homescreen();
                }));
              },
            ),
            GButton(
              icon: Icons.assignment_outlined,
              text: 'About',
            ),
          ]),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Token Screen',
            style: TextStyle(fontFamily: 'Assistant', fontSize: 20),
          ),
        ),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Token Number ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 139, 142, 184),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Center(
                  child: Text(widget.token_no.toString(),
                  style: TextStyle(
                    color: Color.fromARGB(255, 139, 142, 184),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 35, 37, 64),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Lottie.asset('animation/ticket.json'),
                ),
                SizedBox(height: 40,),
                Text('*Note: Please take a screenshot of this page to shop at our pharmacy.',
                style: TextStyle(
                    fontFamily: 'Assistant',
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),),

              ]),
        ),
      ),
    );
  }
}
