import 'package:example/example/communication/Child.dart';
import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  String text = '默认数据';

  void changeText(newText) {
    setState(() {
      text = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         Text(text),
         Child(
           changeText: (newText)=> changeText(newText)
         )
       ],
    );
  }
}