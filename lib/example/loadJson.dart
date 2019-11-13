import 'package:flutter/material.dart';
import 'dart:convert';

class LoadJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
            builder: (context,snapshot) {
              var newData = json.decode(snapshot.data.toString());
              
              return ListView.separated(
                itemCount: newData.length,
                itemBuilder: (context,int index) {
                  return Column(
                    children: <Widget>[
                      Text('name: ${newData[index]['name']}'),
                      Text('height: ${newData[index]['height']}'),
                      Text('mass: ${newData[index]['mass']}'),
                      Text('hair_color: ${newData[index]['hair_color']}'),
                      Text('skin_color: ${newData[index]['skin_color']}'),
                      Text('eye_color: ${newData[index]['eye_color']}'),
                      Text('birth_year: ${newData[index]['birth_year']}'),
                      Text('gender: ${newData[index]['gender']}'),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context,int index) {
                  return Divider(color: Colors.blue,);
                },
              );
            },
          )
        )
      ),
    );
  }
}