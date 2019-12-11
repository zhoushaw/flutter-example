import 'package:flutter/material.dart';

class Child extends StatefulWidget {
  final changeText;
  Child({this.changeText});

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: FlatButton(
         child: Text('切换数据'),
         onPressed: () {
           widget.changeText('新数据');
         },
       ),
    );
  }
}