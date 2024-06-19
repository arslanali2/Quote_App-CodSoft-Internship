import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quoteapp/quotes_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => QuoteScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('splash4.jpg'),
                  fit: BoxFit.cover, // Adjust the image fit
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Welcome to Motivational Quotes App by Arslan Ali", textAlign:TextAlign.center ,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic,color: Colors.white,backgroundColor: Colors.black,
                  fontWeight: FontWeight.w700
                ),),
            ),
          ],


        ),
      ),
    );
  }
}