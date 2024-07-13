import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);



  Widget textFromField({required String hintText}){
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: ListTile(
        leading:Text(hintText) ,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(onPressed: () {

          }, icon:Icon( Icons.edit,color: Colors.black,),
          ),
        ],
      ),
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               Expanded(child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

               children:[

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CircleAvatar(
                     backgroundImage: AssetImage("lib/image/IMG_20221011_081334.jpg"),

                     radius: 50,
                   ),
                 ],
               ),
               textFromField(hintText: "Harikrishnan K"),
               textFromField(hintText: "harikrishnank1230@gmail.com"),
               textFromField(hintText: "Student"),

             ],
           ),
       ),
               Expanded(child: Container(

               ))
      ],
         ),
       ),
       ),
    );
  }
}
