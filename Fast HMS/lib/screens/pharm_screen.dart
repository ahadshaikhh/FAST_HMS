import 'package:fast_hms/screens/medicines_instock.dart';
import 'package:fast_hms/screens/update_stock.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';

class PharmScreen extends StatelessWidget {
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
            ),
            GButton(
              icon: Icons.logout,
              text: 'Logout',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return homescreen();
                }));
              },
            )
          ]),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Pharmacist',
          ),
        ),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return updatestock();
                        }));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 35, 37, 64),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black),
                          ))),
                  child: Text(
                    'Update Stock'.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Assistant',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return medinstock();
                        }));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 35, 37, 64),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black),
                          ))),
                  child: Text(
                    'Medicines in stock'.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Assistant',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}