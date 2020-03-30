import 'package:flutter/material.dart';
import 'dart:async';

import 'package:update_me/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  startSplashTimer() {
    var _duration = new Duration(seconds: 9);
    return new Timer(_duration, navigateToHome);
  }

  navigateToHome() {
   Navigator.pushReplacement(
     context, 
     MaterialPageRoute(
       builder: (context) => HomePage()
     )
    ); 
  }

  @override
  void initState() {
    startSplashTimer();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: deviceHeight * 0.225,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/news.gif")
                )
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.2,
            ),
            Text(
              "Update Me",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Baloo'
              ),
            ),
            Text(
              "News that matters",
              style: TextStyle(
                color: Colors.black,
                height: 1,
                wordSpacing: 1.5,
                fontSize: 22,
                fontFamily: 'Baloo'
              ),
            )
          ],
        ),
      ),
    );
  }
}