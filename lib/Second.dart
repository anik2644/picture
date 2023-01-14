import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testjson/main.dart';

class Second extends StatefulWidget {


  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Title"),),

      floatingActionButton: FloatingActionButton(onPressed: ()
    {
     // Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Hello',)));

      },),
    );
  }
}
