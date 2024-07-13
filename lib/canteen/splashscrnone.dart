import 'dart:async';

import 'package:canteenmanagement/canteen/reg_page.dart';
import 'package:canteenmanagement/canteen/splash.dart';
import 'package:flutter/material.dart';
import 'log.dart';

class Splashone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<Splashone> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => SplashScren()
    )
    );
  }

  initScreen(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('1024.png',
                fit: BoxFit.cover,

              ),
            ),


            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
