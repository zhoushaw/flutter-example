import 'package:flutter/material.dart';

class TextEdit extends StatefulWidget {
  @override
  TextEditState createState() {
    // TODO: implement createState
    return TextEditState();
  }
}

class TextEditState extends State<TextEdit> {
  String result = '';

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('文本编辑')),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Enter text here..."),
                controller: textController,
                onSubmitted: (String str){
                  setState((){
                    result += '\n' + str;
                    textController.text = '';
                  });
                },
              ),
              Text(result)
            ],
          ),
        ),
      ),
    );
  }
}