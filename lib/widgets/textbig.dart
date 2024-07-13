import 'package:canteenmanagement/canteen/single_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ItemsWidgets extends StatefulWidget {
  const ItemsWidgets({Key? key}) : super(key: key);

  @override
  State<ItemsWidgets> createState() => _ItemsWidgetsState();
}

class _ItemsWidgetsState extends State<ItemsWidgets> {
  @override
  Widget build(BuildContext context) {
    return  GridView.count(crossAxisCount: 2,
    shrinkWrap: true,
      childAspectRatio: 0.78,
      children: [
       for(int i=1;i<5;i++)
        Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF232227),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 8,
              ),

            ],
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPage(),));
                },
                child:Container(
                  margin: EdgeInsets.all(10),
                  child:Image.asset('lib/image/1.png',width: 120,height: 120,
                  fit: BoxFit.cover,
                  ) ,
                ) ,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Burger",style: TextStyle(
                    fontSize: 14,
                        fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                ),
              ),
             Container(
               alignment: Alignment.centerLeft,
                child: Text(" Hot Burger",style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
                ),

              ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '55rs',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                    Icon(
                      CupertinoIcons.cart_badge_plus,
                      size: 27,
                      color: Colors.white,
                    )
                  ],
                ),
              ),

            ],

          ),


        )
      ],
    );
  }
}




