import 'dart:async';

import 'package:canteenmanagement/canteen/auth.dart';
import 'package:canteenmanagement/canteen/reg_page.dart';
import 'package:canteenmanagement/canteen/starter.dart';
import 'package:flutter/material.dart';
import 'log.dart';

class SplashScren extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScren> {
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
        builder: (context) => RegPage()
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
        child: Image.asset('lib/image/fast-food-icon-isolated-on-white-background-vector-34511391.jpg',
            fit: BoxFit.cover,

        ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "NCERC CANTEEN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),

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
