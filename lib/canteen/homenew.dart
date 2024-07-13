import 'package:canteenmanagement/canteen/firebaseservices.dart';
import 'package:canteenmanagement/canteen/log.dart';
import 'package:canteenmanagement/canteen/reg_page.dart';
import 'package:canteenmanagement/const/color.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar.dart';
import '../widgets/textbig.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xFF232227),
          body:SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Icon(Icons.sort_rounded,
                            color: Colors.white,
                            size: 35,),
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: Icon(Icons.search,
                              color: Colors.white,
                              size: 35,),
                          )
                        ],
                      )

                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(onPressed: ()  async{
                    await FirebaseServices().signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegPage(),));

                  }, child: Text("Log Out"),
                      style:ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.black54),
          ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                    child: Text("Food ",style: TextStyle(color: Colors.white,
                    fontSize: 32,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Delivers on time",style: TextStyle(color: Colors.white60,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 30,),
                  TabBar(
                    isScrollable: true,
                    indicator: BoxDecoration(),
                    labelStyle: TextStyle(fontSize:20 ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    tabs: [
                      Tab(text: "Burger"),
                      Tab(text: "pizza"),
                      Tab(text: "Drinks"),
                      Tab(text: "Biriyani"),



                    ],

                  ),
                  Flexible(
                      flex:1,
                      child: TabBarView(
                    children: [
                      ItemsWidgets(),
                      ItemsWidgets(),
                      ItemsWidgets(),
                      ItemsWidgets(),



                    ],
                  )
                  )


                ],
              ),
            ),
          ),
        bottomNavigationBar: HomeNavBar(),
      ),
    );
  }
}
