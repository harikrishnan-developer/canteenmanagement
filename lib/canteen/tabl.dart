import 'package:flutter/material.dart';
class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  bool? check2 = false,check3=false,check4=false,check5=false,check6=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 200, 10, 50),
        child: Container(
          child: Column(
            children: [
              CheckboxListTile( //checkbox positioned at right
                value: check2,
                onChanged: (bool? value) {
                  setState(() {
                    check2 = value;
                  });
                },
                title: Text("Table 1"),
              ),
              CheckboxListTile( //checkbox positioned at right
                value: check3,
                onChanged: (bool? value) {
                  setState(() {
                    check3 = value;
                  });
                },
                title: Text("Table 2"),
              ),
              CheckboxListTile( //checkbox positioned at right
                value: check4,
                onChanged: (bool? value) {
                  setState(() {
                    check4 = value;
                  });
                },
                title: Text("Table 3"),
              ),
              CheckboxListTile( //checkbox positioned at right
                value: check5,
                onChanged: (bool? value) {
                  setState(() {
                    check5 = value;
                  });
                },
                title: Text("Table 4"),
              ),
              CheckboxListTile( //checkbox positioned at right
                value: check6,
                onChanged: (bool? value) {
                  setState(() {
                    check6 = value;
                  });
                },
                title: Text("Table 5"),
              ),









            ],
          ),
        ),
      ),
    );
  }
}
