import 'package:canteenmanagement/canteen/starter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebaseservices.dart';
import 'homenew.dart';
import 'log.dart';
class StaffReg extends StatefulWidget {
  const StaffReg({Key? key}) : super(key: key);

  @override
  State<StaffReg> createState() => _StaffRegState();
}

class _StaffRegState extends State<StaffReg> {
  bool showpassword = true;
  bool confpassword=true;



  var nameController=TextEditingController();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void togglepassword()
  {
    setState(() {
      showpassword=!showpassword;

    });
  }
  void toggleconfirmpassword()
  {
    setState(() {
      confpassword=!confpassword;
    });
  }


  var email = '', password = '',confirmpassword='',name='',id='';

  Widget build(BuildContext context) {
    return Scaffold(

      appBar:
      AppBar(
        backgroundColor: Colors.white54,
        elevation:5,


        title:new Padding(padding: const EdgeInsets.only(left:15),

          child: new  Text("Register",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),) ,
        ),
      ),


      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://i.pinimg.com/564x/e2/43/dd/e243dde33edd84e6cee8b494be82c193.jpg"),
              fit: BoxFit.cover),
        ),

        child: Form(
          key: _formKey,



          child: ListView(
            children:[ Column(

              children: [






                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 60,
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {

                          return 'Please Enter Name';
                        }

                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0),


                          hintText: "Name"
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 60,
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter  Email Address';
                        } else if (!value.contains('@gmail.com')) {
                          return 'Enter valid email';
                        }

                        return null;
                      },
                      controller: emailController,

                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0),



                          hintText: "Email"
                      ),
                    ),
                  ),
                ),




                Padding(
                  padding:const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 39,
                    width: 300,

                    child: TextFormField(
                        maxLength: 20,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }

                          return null;
                        },
                        controller: passwordController,
                        obscureText: showpassword,


                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                togglepassword();
                              },
                              child: showpassword
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),



                          hintText: "Password"
                      ),
                    ),
                  ),
                ),


                SizedBox(
                  width:150,
                  height:40,
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                      name = nameController.text;
                      email = emailController.text;
                      password = passwordController.text;

                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Success")));
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text, password: passwordController.text).then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => home(),));


                        }
                        ).onError((error, stackTrace) {
                          print("error${error.toString()}");
                        }
                        );
                      }
                    }
                    );

                  }, child: Text("Submit")),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),

                  child: Center(child: Text("-----Or-----",style: TextStyle(fontSize: 20,color: Colors.black),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    width: 250,
                    height: 40,

                    child: ElevatedButton.icon(

                      onPressed: () async {
                        await FirebaseServices().signInWithGoogle();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MainPage(),));
                      },
                      icon: SizedBox(
                        height: 22,
                        child: Image.network(

                          'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png',),
                      ),



                      label: const Text("CONNECT WITH GOOGLE",style: TextStyle(color: Colors.black),),
                      style:ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Colors.white60),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Already have an account? ",style: TextStyle(fontSize: 15),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Flog(),));


                      }, child: Text("Login")

                      ),




                    ],
                  ),

                ),

              ],
            ),

            ],
          ),
        ),
      ),
    );
  }
}
