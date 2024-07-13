import 'package:flutter/material.dart';
class DonateF extends StatefulWidget {
  const DonateF({Key? key}) : super(key: key);

  @override
  State<DonateF> createState() => _DonateFState();
}

class _DonateFState extends State<DonateF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100),
            child: ElevatedButton(onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("SUCCESS ")));

            }, child: Text("DONATE FOOD")
            ),
          )
        ],
      ),
    );
  }
}
