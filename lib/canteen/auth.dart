import 'package:canteenmanagement/canteen/homenew.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'
;

import 'log.dart';class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData)
    {
    return MainPage();
    }
          else
            {
              return Flog();
            }
            }


      )
    );
  }
}
