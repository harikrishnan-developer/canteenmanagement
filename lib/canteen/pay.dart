import 'package:flutter/material.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool? check2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),

body: Center(
  child: Column(
    children: [
      Container(
        child: Image.asset('lib/image/WhatsApp Image 2023-06-29 at 11.59.03 PM.jpeg',
          fit: BoxFit.cover,

        ),
      ),

    CheckboxListTile( //checkbox positioned at right
    value: check2,
    onChanged: (bool? value) {
    setState(() {
    check2 = value;
    });
    },
    title: Text("Cash On Delivery"),
    ),

    ],
  ),
),



    );
  }
}
