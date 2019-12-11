import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('数据共享')),
        body: Center(
          child: Text('内容')
        )
    );
  }
}
