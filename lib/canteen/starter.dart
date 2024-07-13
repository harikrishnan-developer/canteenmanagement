import 'package:canteenmanagement/canteen/cart.dart';
import 'package:canteenmanagement/canteen/check.dart';
import 'package:canteenmanagement/canteen/log.dart';
import 'package:canteenmanagement/canteen/profilep.dart';
import 'package:canteenmanagement/canteen/reg_page.dart';
import 'package:canteenmanagement/canteen/single_item.dart';
import 'package:canteenmanagement/canteen/tabl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'donate.dart';
import 'firebaseservices.dart';
import 'homenew.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {




  @override

  buildDrawer(){
    return Drawer(
      child: ListView(
        padding:EdgeInsets.zero,


        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
              accountName: Text("Harikrishnan K"),
              accountEmail: Text("harikrishnank1230@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("lib/image/IMG_20221011_081334.jpg")
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: ()
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage(),));

              },
              icon: Icon(
          Icons.person,
              ),
            ),
            title: Text("Profile"),

          ),
          ListTile(
            leading: IconButton(
              onPressed: (){

              },
              icon: Icon(
                Icons.favorite,
              ),
            ),
            title: Text("Favourite"),

          ),
          ListTile(
            leading: IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage(),));

              },
              icon: Icon(
                Icons.shopping_cart,
              ),
            ),
            title: Text("Cart"),

          ),
          ListTile(
            leading: IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TablePage(),));
              },


              icon:  Icon(
                Icons.table_restaurant,
              ),
            ),
            title: Text("Choose Table"),

          ),
          ListTile(
            leading: IconButton(
              onPressed: (){
    },


              icon:  Icon(
                Icons.shopping_basket_sharp,
              ),
            ),
            title: Text("My Orders"),

          ),
          ListTile(
            leading: IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DonateF(),));

              },


              icon:  Icon(
                Icons.food_bank_outlined,
              ),
            ),
            title: Text("Donation-limit wastage"),

          ),
          ListTile(
            leading: IconButton (
              onPressed:() async {
            await FirebaseServices().signOut();
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => Flog(),));

            },

            icon:Icon(Icons.exit_to_app,
            ),
    ),
            title: Text("Log Out"),

          ),
        ],
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
      icon: const Icon(Icons.exit_to_app,),

      onPressed: () {
        FirebaseAuth.instance.signOut().then((value) =>
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Flog(),))
        );
      }
        )





        ],
      ),
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 7,
              shadowColor: Colors.grey[300] ,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  hintText: "Search your Food",
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
                ),
              ),
            ),
          ),
          ListTile(
            leading: Text("Categories",style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal,
            color: Colors.grey[600],
            ),),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Categories(

                  categoryname: "Food",

                  image: "lib/image/pexels-marvin-ozz-2474661.jpg",
                ),
                Categories(
                  categoryname: "Burger",
                  image: "lib/image/4.png",
                ),
                Categories(
                  categoryname: "Drinks",
                  image: "lib/image/Grenadine-diabolo-05c968f.jpg",
                ),



              ],
            ),
          ),

          ListTile(
            leading: Text("Items",style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal,
            ),),
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SingleItemPage(),));

          }, child: Text("."),
            style: ButtonStyle(

              backgroundColor:MaterialStateProperty.all(Colors.white),
                ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [

            SingleProduct(
              name :"Biriyani"   ,
            image:"lib/image/istockphoto-516401834-612x612.jpg",
            ),
                SingleProduct(


                  name:"parotta" ,
                  image: "lib/image/67b47c522c5a4e55bccbfa57c258df80.jpg",
                ),





              ],
            ),
          ),

          ListTile(
            leading: Text("Best Sell",style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal,
            ),),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [

                SingleProduct(
                  name: "Parotta with chicken Curry",
                  image: "lib/image/parota curry-20180514-042439.jpg",
                ),
                SingleProduct(
                  name: "Puffs",
                  image: "lib/image/images.jpg",

                ),





              ],
            ),
          ),

        ],
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String image;
  final String name;
  const SingleProduct({Key? key, required this.image, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(12.0),

          height: 200,
          width: 150,
          decoration: BoxDecoration(


    image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage(
    image
    ), ),
            color: Colors.cyan,

            borderRadius: BorderRadius.circular(20),
          ),

        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



            ],
          ),
        )
      ],
    );
  }
}




class Categories extends StatelessWidget {
  final String image;
  final String categoryname;
  const Categories({Key? key,required this.categoryname,required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(12.0),
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
          image
        ), ),
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child: Text(categoryname,style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 19),

        ),
      ),
    );
  }
}




