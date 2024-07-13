
import 'package:canteenmanagement/canteen/check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar:SizedBox(
        height: 50,
        child: ElevatedButton(

          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CheckOut(),));

          }, child: Text("check out"),
        ),
      ) ,



      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            height:150 ,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow:[ BoxShadow(
                color: Colors.black.withOpacity(0.5),blurRadius: 10
              ),
      ],
            ),
            margin: EdgeInsets.all(20.0),
            child:Row(
              children: [
                Expanded(child: Container(
                  decoration: BoxDecoration(
                   image: DecorationImage(
                     fit: BoxFit.cover,
                     image: AssetImage("lib/image/bg.png"),
                   ),

            ),),),
                Expanded(

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Burger",style: TextStyle(
                            fontSize: 18,

                          ),),
                          Text("Food",style: TextStyle(

                          ),),
                          Text("\$30",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,

                          ),),
                          Row(
                            children: [
                              MaterialButton(
                                minWidth:40,
                                height: 30,
                                onPressed: () {


                              },
                                color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                                child: Icon(Icons.add,color: Colors.white,),

                              ),

                              MaterialButton(
                                minWidth:40,
                                height: 30,
                                onPressed: () {

                              },
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Icon(Icons.minimize,color: Colors.white,),

                              ),
                            ],
                          )
                        ],
                      ),
                    ))

              ],
            ) ,
          )
        ],
      ),

    );
  }
}