
import 'package:flutter/material.dart';

class UseTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主题')
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Text('主题'),
        ),
      )
    );
  }
}