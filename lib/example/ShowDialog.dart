import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AlertDialog dialog = AlertDialog(
      content: Text('hello world', style: TextStyle(fontSize: 30),)
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('展示弹窗'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('show dialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context){
                return dialog;
              }
            );
          },
        ),
      ),
    );
  }
}