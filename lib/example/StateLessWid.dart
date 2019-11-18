import 'package:flutter/material.dart';

class StateLessWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MyCard(
          Text('内容'),
          Icon(Icons.favorite, color: Colors.red)
        )
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('无状态Widget'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: column,
            )
        ));
  }
}

class MyCard extends StatelessWidget {
  final Widget title;
  final Widget icon;

  MyCard(this.title, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[this.icon,this.title],
          ),
        ),
      ),
    );
  }
}
