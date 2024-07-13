import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:canteenmanagement/canteen/homenew.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


import 'animations/animate.dart';
import 'canteen/homescreeen.dart';
import 'canteen/otp.dart';
import 'canteen/reg_page.dart';
import 'canteen/splash.dart';
import 'canteen/starter.dart';
import 'canteen/starter.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(


      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: { 'otp': (context) => MyVerify(),
      },





      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(splash: Image.asset('lib/image/256x256bb.jpg'

      ),duration:3000,
          pageTransitionType : PageTransitionType.bottomToTop,

          backgroundColor: Colors.white,

          nextScreen: SplashScren()),
    );
  }
}


