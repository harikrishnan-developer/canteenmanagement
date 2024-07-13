import 'package:canteenmanagement/canteen/pay.dart';
import 'package:canteenmanagement/canteen/reg_page.dart';
import 'package:flutter/material.dart';
class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Check Out',style: TextStyle(
          color: Colors.black
        ),),


      ),
      body: Column(
        children: [
          Expanded(child: Container(


          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("lib/image/bg.png"),
            ),

          ),),
          ),
          Expanded(child:
              Column(
          children: [
            ListTile(
              leading: Text("sub title"),
              trailing: Text("\$123"),
            ),
            ListTile(
              leading: Text("discount"),
              trailing: Text("%5"),
            ),
            ListTile(
              leading: Text("shipping "),
              trailing: Text("\$10"),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Text("Total"),
              trailing: Text("\$500"),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentPage(),));
              }, child: Text("Buy")),
            ),

          ],
          )
          ),
        ],

      ),

    );
  }
}
