import 'package:flutter/material.dart';

import 'addorderr.dart';
import 'canteendetailspage.dart';
import 'onlineorderpage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new AddOrder(),
    new OnlineOrder(),
    new CanteenDetails(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  Future _onBackPressed()  {
    return showDialog(
      context: context,
      builder :(context)=> AlertDialog(
        title: Text('Do You want To Exit App?'),
        actions: <Widget>[
          TextButton(
              onPressed:() {

              },
              child: Text('Yes')),

          TextButton(
              onPressed:() {
                Navigator.pop(context,false);
              },
              child: Text('Yes')),

        ],
      ),
    );
  }

  @override

  Widget build(BuildContext context) {

    return  Scaffold(

            appBar: AppBar(title: Text('My Canteen'),
        actions: [
        PopupMenuButton(itemBuilder:(context) =>[
      PopupMenuItem(
          child:ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
              ),

          )),

      const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.lightbulb_circle),
            title: Text("Theme"),
          )),
      PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          )),
      PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          )
      ),
    ],
    )
    ],
            ),


    );
  }

}