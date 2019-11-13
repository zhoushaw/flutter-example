import 'package:flutter/material.dart';

class ChangeText extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文案切换"),
      ),
      body: Center(
        child: ChangeTextFn(),
      ),
    );
  }
}

class ChangeTextFn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChangeTextFnState();
  }
}

class ChangeTextFnState extends State<ChangeTextFn> {
  int textIndex = 0;
  List textList = [
    'Flutter',
    'is',
    'cool',
    'and',
    'awesome'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(textList[textIndex]),
        RaisedButton(
          child: Text('切换',style: TextStyle(color: Colors.white),),
          color: Colors.red[300],
          onPressed: (){
            if (textIndex==textList.length-1){
              textIndex = 0;
            } else {
              textIndex++;
            }
            setState(() {
              textIndex = textIndex;
            });
          },
        )
      ],
    );
  }
}