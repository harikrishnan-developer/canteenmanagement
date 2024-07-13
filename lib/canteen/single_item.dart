import 'package:canteenmanagement/canteen/singlenav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SingleItemPage extends StatefulWidget {
  const SingleItemPage({Key? key}) : super(key: key);

  @override
  State<SingleItemPage> createState() => _SingleItemPageState();
}

class _SingleItemPageState extends State<SingleItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232227),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25,left: 15,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 32,

                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      CupertinoIcons.cart_fill,
                      color: Colors.white,
                      size: 32,

                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),

              child: Image.asset('lib/image/bg.png',
              height: MediaQuery.of(context).size.height/1.7,
                fit: BoxFit.cover,
              ),),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hot & Fresh Burger",style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(CupertinoIcons.minus,
                          color: Colors.black,
                          size: 20,),
                        ),
                        SizedBox(width: 8,),
                        InkWell(
                          onTap: () {

                          },
                          child: Text("2",style: TextStyle(color: Colors.white,
                          fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(CupertinoIcons.plus,
                            color: Colors.black,
                            size: 20,),
                        )
                      ],)

                    ],
                  ),

                  ),
                  SizedBox(height: 15,),
                  Text("we bring you the burger with cheese served with onion",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 18,

                  ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SingleItemNavBar(),


    );
  }
}
