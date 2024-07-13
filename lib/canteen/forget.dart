import 'package:canteenmanagement/canteen/davara.dart';
import 'package:canteenmanagement/canteen/reg_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);
  static String verify="";

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController countrycode=TextEditingController();
  var phone="";
  void initstate(){
    countrycode.text='91';
    super.initState();
  }
  var emailController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  var email='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage("https://i.pinimg.com/236x/f4/54/f7/f454f75292f93e2b6c66846a857edf44.jpg"),
    fit: BoxFit.cover),
    ),

    child: Form(        key: _formKey,

        child: ListView(
          children:[ Column(

            children: [



              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text("Forgot your Password?",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
              ),

              Icon(Icons.lock, size: 80,),


              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(" Enter your phone number below to login" ,
                  style: TextStyle(color: Colors.black),),
              ),


              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value){
                    phone=value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {

                      return 'Please enter phone number';
                    }


                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(

                    label: Text("Phone"),

                    border: OutlineInputBorder(

                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 320,
                child: ElevatedButton(onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countrycode.text+phone}',
                    verificationCompleted: (PhoneAuthCredential credential){},
                    verificationFailed:(FirebaseAuthException e){},
                    codeSent: (String verifiicationId, int?resentToken){
                      ForgetPass.verify=verifiicationId;
                      Navigator.pushNamed(context, "otp");
                    },
                    codeAutoRetrievalTimeout: (String verificationId){},

                  );

                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("OTP sent ")));
                    }
                  });
                },

                    child: Text("Send OTP",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                    style:ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.lightBlue),
                    )
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(10),

                child: Center(child: Text("Or",style: TextStyle(fontSize: 20,color: Colors.black),)),
              ),

              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegPage()),);


              },
                  child: Text("Create new account", style: TextStyle(color: Colors.lightBlue,fontSize: 20),)
              )



            ],
          ),
          ],
        ),
      ),
        ),
    );
  }
}

