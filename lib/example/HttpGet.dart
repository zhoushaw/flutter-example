import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpGet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpGetState();
  }
}

class HttpGetState extends State<HttpGet> {
  final String url = 'https://swapi.co/api/people';
  List data = [];

  @override
  void initState () {
    super.initState();
    this.getState();
  }

  Future getState () async {
    var response = await http.get(
      url,  
      headers: {"Accept": "application/json"}
    );

    final dataConvertJson = json.decode(response.body);

    setState(() {
      data = dataConvertJson['results'];
    });

    return 'Successful';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Retrieve JSON Data via HTTP GET')),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, int index) {
          return Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Container(
                    child: Text(
                      data[index]['name']
                    ),
                    padding: EdgeInsets.all(15.0),
                  ),
                )
              ],
            )
          ),
        );
        },
      )
      
    );
  }
}