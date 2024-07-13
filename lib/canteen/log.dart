import 'package:canteenmanagement/canteen/homenew.dart';
import 'package:canteenmanagement/canteen/reg_page.dart';
import 'package:canteenmanagement/canteen/starter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';

import 'auth.dart';
import 'forget.dart';

class Flog extends StatefulWidget {
  const Flog({Key? key}) : super(key: key);

  @override
  State<Flog> createState() => _FlogState();
}

class _FlogState extends State<Flog> {


  bool showpassword = true;

  @override
  void togglepassword() {
    setState(() {
      showpassword = !showpassword;
    });
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var email = '', password = '';
  void SignuserIn ()  async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);
  }
  Widget build(BuildContext context) {
    return Scaffold(

        body: DecoratedBox(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage("https://i.pinimg.com/564x/96/7b/30/967b304f0f7d49d9bb1e81ec80fba24d.jpg"),
    fit: BoxFit.cover),
    ),

    child: Form(

    key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 220, 20),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 200, 0),
                  child: Text(
                    "Welcome back , please login to your account.",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: SizedBox(
                    height: 25,
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
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: SizedBox(
                    height: 40,
                    width: 300,
                    child: TextFormField(
                      maxLength: 20,style:TextStyle(color:Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
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
                          hintText: "Password"),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgetPass()),
                        );
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.blueGrey),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 1200,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {

                          setState(() async {
                            email = emailController.text;
                            password = passwordController.text;
                            if (_formKey.currentState!.validate()) {
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: emailController.text, password: passwordController.text).then((value) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => home(),));


                              }
                              ).onError((error, stackTrace) {
                                print("error${error.toString()}");
                              }
                              );

                            }
                          });

                        },
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegPage()),
                            );
                          },
                          child: Text(
                            "Create new account",
                            style: TextStyle(color: Colors.green),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                      child: Text(
                    "Or",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    width: 250,
                    height: 40,

                    child: ElevatedButton.icon(

                      onPressed: () {

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
                ],
              )
              ],
            )


      ),
        ),
    );
  }
}
