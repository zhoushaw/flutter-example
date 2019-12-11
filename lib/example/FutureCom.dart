import 'package:flutter/material.dart';

class FutureCom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FutureComState();
  }
}
Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}

class FutureComState extends State<FutureCom>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('异步UI组件')),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter(), //
          //initialData: ,// a Stream<int> or null
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
            }
            return null; // unreachable
          },
        )
      )
    );
  }
}